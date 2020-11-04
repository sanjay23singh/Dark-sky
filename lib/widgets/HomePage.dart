import 'dart:async';
import 'dart:convert';
// import 'package:DarkSkyy/models/Vars.dart';
//api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$key&units=metrics"
import 'package:DarkSkyy/models/Vars.dart';
import 'package:DarkSkyy/models/getCurrentLocation.dart';
import 'package:DarkSkyy/models/getTemplateData.dart';
import 'package:DarkSkyy/models/listCard.dart';
import 'package:DarkSkyy/models/responseModel.dart';
import 'package:DarkSkyy/widgets/dayTemplate.dart';
// import 'package:DarkSkyy/widgets/nightTemplate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String key = "84e9366976ba919f475a47108c0de969";
  double lat = -1;
  double lgt = -1;
  var data;
  List<ListCard>list=[];


//GetLocation
  Future<void> getLocc() async {
    GetLocation loc = new GetLocation();
    await loc.getLocation();
    lat = loc.latitude;
    lgt = loc.longitude;
  }

//Get Response
  getRes() async {
    GetResponse resp = new GetResponse(
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lgt&appid=$key&units=metric");
    data = await resp.getResponse();
    // print("ddaa");
  }

  initState() {
    super.initState();

    getLocc().then((value) => getRes()).then((value) {
      if (data == null || lat == -1 && lgt == -1) {
        Navigator.of(context).pushReplacementNamed('Error');
      } else {
        var obj = json.decode(data);
        // print(data);

        // print( DateTime.fromMillisecondsSinceEpoch(obj['sys']['sunrise']*1000).toString());
        // print( DateTime.fromMillisecondsSinceEpoch(obj['sys']['sunset']*1000).toString());

        TemplateCreatingClass tc=new TemplateCreatingClass(obj);
        Vars v=tc.getTemplateData();

         Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => DayTemplate(v,list)));
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: SpinKitDoubleBounce(
            color: Colors.black,
            size: 50.0,
          ),
        ),
      ),
    );
  }
}
