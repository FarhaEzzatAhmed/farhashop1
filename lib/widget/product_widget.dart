import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:shop/screen/add_product_screen.dart';
import 'package:shop/screen/edit_product_screen.dart';
import 'package:shop/screen/favourite_screen.dart';
import 'package:favorite_button/favorite_button.dart';
import '../screen/favourite_screen.dart';
import '../screen/yourproduct_screen.dart';
import '../provider/product.dart';
import '../screen/product_screen.dart';
import '../screen/edit_product_screen.dart';

class productwidget extends StatelessWidget {
  final String title;
  final String id;
  final String imageUrl;
  final String price;
  final String description;
  final Status? status;
  //final Function onchange;
  const productwidget(this.title, this.id, this.imageUrl, this.price,
      this.description, this.status,
      {Key? key});

  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments;
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
          color: Colors.white,
          child: ListTile(
            title: Text(title),
            leading: CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(imageUrl),
              backgroundColor: Colors.transparent,
            ),
          )),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Edit',
          color: Colors.black45,
          icon: Icons.edit,

          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
                   return editproductscreen(id);
            }));
             //Navigator.pushNamed(context, '/editProduct', arguments: {'id': id});
          },

          //Provider.of<products>(context,listen: false).changeStatuss(id);
        ),
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () =>
              Provider.of<products>(context, listen: false).removeproduct(id),
        ),
      ],
    );
  }
}
