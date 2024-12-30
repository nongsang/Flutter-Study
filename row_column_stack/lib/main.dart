import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Test", style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Column(
         children: [
           Container(
             margin: EdgeInsets.only(bottom: 5),
             color: Colors.yellow,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Container(color: Colors.red, width: 50, height: 100,),
                 Container(color: Colors.green, width: 50, height: 50,),
                 Container(color: Colors.blue, width: 50, height: 150,),
               ],
             ),
           ),

           Container(
             margin: EdgeInsets.only(bottom: 5),
             color: Colors.yellow,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               crossAxisAlignment: CrossAxisAlignment.end,
               children: [
                 Container(color: Colors.red, width: 50, height: 100,),
                 Container(color: Colors.green, width: 50, height: 50,),
                 Container(color: Colors.blue, width: 50, height: 150,),
               ],
             ),
           ),

           Container(
             margin: EdgeInsets.only(bottom: 5),
             color: Colors.yellow,
             height: 150,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: [
                 Container(color: Colors.red, width: 50, height: 100,),
                 Container(color: Colors.green, width: 50, height: 50,),
                 Container(color: Colors.blue, width: 50, height: 150,),
               ],
             ),
           ),

           Container(
             margin: EdgeInsets.only(bottom: 5),
             color: Colors.yellow,
             height: 150,
             child: Stack(
               children: [
                 Container(color: Colors.red,),
                 Container(color: Colors.green, width: 100, height: 100,),
                 Container(color: Colors.blue, width: 50, height: 50, ),
               ],
             ),
           ),
         ],
        )
      )
    );
  }
}