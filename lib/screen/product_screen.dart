import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/product.dart';
//import '../model/data.dart';
import '../provider/product_item.dart';
import '../screen/home_screen.dart';
import '../screen/favourite_screen.dart';
class productScreen extends StatelessWidget {
  //final Function onchange;
  //final List<product>_products;
  const productScreen( 
  {
     Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    var _products=Provider.of<products>(context).filterproduct();
  
   return   GridView.builder(
    itemCount:_products.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,mainAxisSpacing: 90,crossAxisSpacing: 10,),
     
     itemBuilder: (context,index)=>
     productitem(_products[index].title,_products[index].id,_products[index].imageUrl,_products[index].price,_products[index].description,_products[index].status,
        )
  );
    
    //return GridView.count(
      //scrollDirection: Axis.vertical,
      //crossAxisCount: 2,
    
     
      
     // children:List.generate(6,(index) => productitem(_products[index].title,_products[index].id,_products[index].imageUrl,_products[index].status))
      
    
     // );
  }
}