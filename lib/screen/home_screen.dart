import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/screen/yourproduct_screen.dart';
import 'favourite_screen.dart';
import './product_screen.dart';
import '../provider/product.dart';
import 'yourproduct_screen.dart';


class homescreen extends StatefulWidget {
  const homescreen({ Key? key }) : super(key: key);

  @override
  homescreenState createState() => homescreenState();
}

class homescreenState extends State<homescreen> {
  
  int _currentIndex=0;
  late  List<Map <String,dynamic>> _pages;
  
   

  void _changepage(int index){
    setState(() {
      _currentIndex=index;
    });
    

  } @override
  void initState() {
    
    _pages=[
      {
        'title':'Myshope',
        'page': productScreen(),
        //[..._products] 
         

      },
      {
        'title':'favourite',
        'page': favouriteScreen(),

      },
      
      
      
    ];
    super.initState();
  }
   
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
         appBar: AppBar(
        
        title: Text(_pages[_currentIndex]['title']),
        backgroundColor: Colors.pink[400],
        elevation:4,
        actions:<Widget> [
        IconButton(icon: Icon(Icons.badge_outlined),onPressed:(){ 
          
          Navigator.push(context, MaterialPageRoute(builder:(BuildContext context){
            return yourproductscreen();
          }));

        })
        
      ],
      ),
      body:
      
       FutureBuilder(
        future:Provider.of<products>(context).getData() ,
        builder:(ctx,snapshot) {
          if(snapshot.connectionState==ConnectionState.done){
          return _pages[_currentIndex]['page'];
          }
          return Center(
            child:CircularProgressIndicator() ,

         );
        } ,) ,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _changepage,
        backgroundColor:Colors.pink[400],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black45,
        items: [
         BottomNavigationBarItem(
           icon:Icon(Icons.category),
           label: 'product'
        ),
         BottomNavigationBarItem(
           icon:Icon(Icons.star),
           label: 'favorite'
        ),
      ],
      ),
    ),
    );
  }
}