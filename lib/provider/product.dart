import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shop/screen/edit_product_screen.dart';
import 'package:shop/screen/favourite_screen.dart';
import '../screen/product_screen.dart';
import '../screen/home_screen.dart';
//import '../model/data.dart';
import '../provider/product_item.dart';
import '../screen/edit_product_screen.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_database/firebase_database.dart';

enum Status { favourite }

class product {
  String id, title, imageUrl, price, description;

  Status? status;

  product(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.price,
      required this.description,
      this.status});
}

class products with ChangeNotifier {

  List<product> _products = [];
  product findbyid(String id)=>_products.firstWhere((element)=>element.id==id);
 
  List<product> filterproduct({Status? status}) {
     
    return _products.where((element) => element.status == status).toList();
  
  }

  Future<void> getData() async {
    var dbref = FirebaseDatabase().reference().child('products');
    var response = await dbref.get();

    //var url=
    //Uri.parse('https://shop-7fa03-default-rtdb.firebaseio.com/products.json');

    //var response=await http.get(url);

    ////print(response.body);
    //var exrtactedDta=json.decode(response.body);
    var exrtactedDta = response.value;
    //as Map<String,dynamic>;
    //if(exrtactedDta==null){
    // return;
    // }
    _products = [];
    if (exrtactedDta == null) {
      return;
    }
    exrtactedDta.forEach((id, data) {
      _products.add(
        product(
          title: data['title'],
          id: id,
          imageUrl: data['imageUrl'],
          price: data['price'],
          description: data['description'],
          status:coverttostatus(
          data['status'],
        ),
         
        )
      );
    });
  }

  Future<void> addproduct(
    String title,
    id,
    imageUrl,
    price,
    description,
  ) async {
    //var url= Uri.parse('https://shop-7fa03-default-rtdb.firebaseio.com/products.json');

    //await http.post(

    //url,body: json.encode(
    // {
    // 'title':title,
    // 'id':id,
    //'imageUrl':imageUrl,
    //'price':price,
    //'description':description,

    //},
    //)
    ///);
    ///old

    //print(response.body);

    //_products.add(product(
    //title:title,
    //id:json.decode(response.body)['name'],
    //imageUrl:imageUrl,
    //price:price,
    //description:description));
    var dbref = FirebaseDatabase().reference().child('products').push();
    await dbref.set(
      {
        'title': title,
        'id': id,
        'imageUrl': imageUrl,
        'price': price,
        'description': description,
      },
    );

    notifyListeners();
  }

  void editproduct(
    String title,
    id,
    imageUrl,
    price,
    description,
  ) {

    _products.add(product(
        title: title,
        id: title,
        imageUrl: imageUrl,
        price: price,
        description: description));
    notifyListeners();
  }

  Future<void> changeStatus(
    String id,
    Status status,
  ) async {
    var dbref = FirebaseDatabase().reference().child('products').child(id);
    dbref.update({
     'status': convertformatstatus(status),
    });

    //setState(() {
    //_products.firstWhere((element) => element.id==id).status=status;
    notifyListeners();
    //});
  }

  //void changestatuss(String id,Status status){
  //_products.firstWhere((element) => element.id==id).status=status;
  //  notifyListeners();

  //}
  void changeStatuss(String id,Status) {
    //setState(() {
    _products.firstWhere((element) => element.id == id);
    notifyListeners();
    //});
  }
  


  void removeproduct(String id) async {
    // var url= Uri.parse('https://shop-7fa03-default-rtdb.firebaseio.com/products/$id.json');
    //await http.delete(url);
    ///_products.removeWhere((element) =>element.id==id);
    var dbref = FirebaseDatabase().reference().child('products').child(id);
    await dbref.remove();
    notifyListeners();
  }

    String convertformatstatus(Status status) {
    if (status == Status.favourite) 
    {
      return 'favourite';
    }
    return 'null' ;
  }


  Status?coverttostatus(String?status){
    if (status=='favourite'){
    return Status.favourite;
  }else{
    return null;
  }
  }
   Future<void> Updateproduct(
    String title,
   String id,
     String imageUrl,
     String price,
   String description, ) async{
      var dbref = FirebaseDatabase().reference().child('products').child(id);
        await dbref.update({
        'title': title,
        'id': id,
        'imageUrl': imageUrl,
        'price': price,
        'description': description,
        });
        notifyListeners();
    }
}
