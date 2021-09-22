import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/screen/yourproduct_screen.dart';
import 'favourite_screen.dart';
import './product_screen.dart';
import '../provider/product.dart';
import 'yourproduct_screen.dart';
import '../widget/product_widget.dart';
import '../screen/add_product_screen.dart';

class yourproductscreen extends StatelessWidget {
  const yourproductscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _products = Provider.of<products>(context).filterproduct();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text('Your product'),
            backgroundColor: Colors.pink[400],
            elevation: 4,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.pushNamed(context, '/addProduct');
                },
              )
            ]),
        body: ListView.separated(
            itemBuilder: (context, index) => productwidget(
                  _products[index].title,
                  _products[index].id,
                  _products[index].imageUrl,
                  _products[index].price,
                  _products[index].description,
                  _products[index].status,
                ),
            separatorBuilder: (context, index) => Divider(
                  thickness: 2,
                ),
            itemCount: _products.length),
      ),
    );

    //Scaffold(
    //appBar: AppBar(
    //title: Text('Your product'),
    //backgroundColor: Colors.pink[400],
    //elevation:4,
    //actions:<Widget> [
    //IconButton(icon: Icon(Icons.add),
    //onPressed:()=>Navigator.pushNamed(context, addproductscreen.routeName),

    // )

    // ]
    // ),

    // );
  }
}
