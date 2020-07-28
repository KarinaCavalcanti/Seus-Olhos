import 'package:flutter/material.dart';
import 'package:seus_olhos/funcoes/menu_lateral.dart';

class PagePrincipal extends StatefulWidget {
  @override
  _PagePrincipalState createState() => _PagePrincipalState();
}

class _PagePrincipalState extends State<PagePrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         //onde fica a barra na parte de cima
         appBar: AppBar( 
           title: Text(
             'Seus Olhos',
             style: TextStyle( 
               fontSize: 25,
             ),

             ),
           backgroundColor: Color(0XFF00BBCD),
         ),

         drawer: MenuLateral(),

         body: Container(
           padding:  EdgeInsets.all(20),
           child: Center(
             child: ListView(
               children: <Widget>[ 
                 

                 Container(width: MediaQuery.of(context).size.width, height: 150, decoration: BoxDecoration( color: Colors.red, borderRadius: BorderRadius.circular(10.0), ),),

                SizedBox(height: 30,),

                 Container(width: MediaQuery.of(context).size.width, height: 150, decoration: BoxDecoration( color: Colors.blue, borderRadius: BorderRadius.circular(10.0),),),

                SizedBox(height: 30,),

                 Container(width: MediaQuery.of(context).size.width, height: 150, decoration: BoxDecoration( color: Colors.purple, borderRadius: BorderRadius.circular(10.0),),),
                 
                 SizedBox(height: 30,),

                 Container(width: MediaQuery.of(context).size.width, height: 150, decoration: BoxDecoration( color: Colors.green, borderRadius: BorderRadius.circular(10.0),),),
                 
                 SizedBox(height: 30,),

                 Container(width: MediaQuery.of(context).size.width, height: 150, decoration: BoxDecoration( color: Colors.orange, borderRadius: BorderRadius.circular(10.0),),),
                 
                 
               ],
             ),
           ),
         ),
          
      
    );
  }
}









// class Home extends StatefulWidget {
//   @override 
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {

//   @override 
//   Widget build(BuildContext context) {
//         return Scaffold(
//             //onde fica a barra na parte de cima
//          appBar: AppBar( 
//            title: Text(
//              'Seus Olhos',
//              style: TextStyle( 
//                fontSize: 25,
//              ),

//              ),
//            backgroundColor: Color(0XFF00BBCD),
//          ),

//          drawer: MenuLateral(),
          
//     );
//   } 

// }