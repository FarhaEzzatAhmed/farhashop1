

import 'package:flutter/material.dart';
import 'package:shop/provider/product.dart';
class productinformation extends StatelessWidget {
  final String title;
  final String id;
  final String imageUrl;
  final String price;
  final String description;
  final Status? status;
  //final Function onchange;
  const productinformation(this.title, this.id, this.imageUrl, this.price,
      this.description, this.status,
      {Key? key});

 

  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(
      title: Text(title),

      backgroundColor: Colors.pink[400],
        elevation:4,
    ),
    body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: ListView(
          
          children: [
             Image.network(imageUrl,height: 350,
          fit: BoxFit.cover,
          
          ),
          
            Text(price,
             style:TextStyle(backgroundColor:Colors.grey,fontSize: 30)),
             Text(description, style:TextStyle(backgroundColor:Colors.grey,fontSize: 30)),
            
          ],
        ),
      ),
    )

    );
      
  
  }
}