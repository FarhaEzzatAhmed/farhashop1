import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/product.dart';
import '../widget/product_widget.dart';

class editproductscreen extends StatefulWidget {
  //final String title;
  final String id;
  //final String imageUrl;
  //final String price;
  //final String description;
  //final Status? status;
  const editproductscreen(//this.title, this.id, this.imageUrl, this.price,
      //this.description, this.status,
      this.id,{Key? key}) : super(key: key);
  // static const routeName = '/edit_product_screen';

  @override
  _editproductscreen createState() => _editproductscreen();
}

class _editproductscreen extends State<editproductscreen> {
  @override
  bool _isFirst=true;
  var  _args;
  var _titlecontroller = TextEditingController();
  var _imageUrlcontroller = TextEditingController();
  var _pricecontroller = TextEditingController();
  var _descriptioncontroller = TextEditingController();
  
  @override
  void didChangeDependencies() {
    if (_isFirst) {
      _args = ModalRoute.of(context)!.settings.arguments;
      print(_args);
      _isFirst = false;
    }
    super.didChangeDependencies();
  }
  Widget build(BuildContext context) {
    var product;
    if(_args !=null){
     product=Provider.of<products>(context).findbyid(_args['id']);
     _titlecontroller.text=product.title;
     _imageUrlcontroller.text=product.imageUrl;
     _pricecontroller.text=product.price;
      _descriptioncontroller.text=product.description;
    }
    var _products = Provider.of<products>(context).filterproduct();
    return Scaffold(
      appBar: AppBar(
          title: Text('Edit product'),
          backgroundColor: Colors.pink[400],
          elevation: 4,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  Provider.of<products>(context, listen: false).Updateproduct(
                      _titlecontroller.text,
                      _titlecontroller.text,
                      _imageUrlcontroller.text,
                      _pricecontroller.text,
                      _descriptioncontroller.text);

                  Navigator.pop(context);
                })
          ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextField(
                controller: _titlecontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Title',
                )),
            //SizedBox(
            // height: 10,
            //),
            //TextField(
            //decoration:InputDecoration (
            //border: OutlineInputBorder() ,
            //labelText: 'id',
            //)
            //),
            SizedBox(
              height: 10,
            ),
            TextField(
                controller: _imageUrlcontroller,
                keyboardType: TextInputType.url,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'imge url',
                )),
            SizedBox(
              height: 10,
            ),
            TextField(
                controller: _pricecontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'price',
                )),
            SizedBox(
              height: 10,
            ),
            TextField(
                controller: _descriptioncontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                )),
          ],
        ),
      ),
    );
  }
}
