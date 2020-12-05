import 'package:DarkSkyy/widgets/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './widgets/Error.dart';

void main()
{
   WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_) {
      runApp(new MyApp());
    });
}

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