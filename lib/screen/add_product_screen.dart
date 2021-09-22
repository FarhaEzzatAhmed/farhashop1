import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/product.dart';

class addproductscreen extends StatefulWidget {
  // static const routeName='/add_product_screen';
  const addproductscreen({Key? key}) : super(key: key);

  @override
  _addproductscreenState createState() => _addproductscreenState();
}

class _addproductscreenState extends State<addproductscreen> {
  @override
  var _titlecontroller = TextEditingController();
  var _imageUrlcontroller = TextEditingController();
  var _pricecontroller = TextEditingController();
  var _descriptioncontroller = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('add product'),
          backgroundColor: Colors.pink[400],
          elevation: 4,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  Provider.of<products>(context, listen: false).addproduct(
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
