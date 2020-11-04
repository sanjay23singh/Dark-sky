import 'package:DarkSkyy/widgets/HomePage.dart';
import 'package:flutter/material.dart';
import './widgets/Error.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget
{
  build(context)
  {
    // print("A");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage(),
      routes: {
        "Error":(context)=>ErrorPage(),
      },
    );
  }
}