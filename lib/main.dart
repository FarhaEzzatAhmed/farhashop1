import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/provider/product.dart';
import './screen/edit_product_screen.dart';
import './screen/add_product_screen.dart';
import './screen/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: products(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (_) => homescreen(),
          '/addProduct': (context) => addproductscreen(),
        // '/editProduct': (context) => editproductscreen(),
        },
      ),
    );
  }
}
