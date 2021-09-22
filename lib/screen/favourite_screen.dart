import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/product_item.dart';
import '../screen/home_screen.dart';
import '../screen/product_screen.dart'; 
import '../provider/product.dart';
class favouriteScreen extends StatelessWidget {
  //final List<product>_products;
  //final Function onchange;
  
  const favouriteScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   var _products=Provider.of<products>(context).filterproduct(status: Status.favourite);

   
   return  GridView.builder(
    itemCount:_products.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,mainAxisSpacing: 90,crossAxisSpacing: 10,),
     
     itemBuilder: (context,index)=>
     productitem(_products[index].title,_products[index].id,_products[index].imageUrl,_products[index].price,_products[index].description,_products[index].status,)
  );
   
}}