import 'dart:convert';
import 'package:DarkSkyy/models/listCard.dart';
import 'package:flutter/material.dart';
import '../models/responseModel.dart';
import '../models/Vars.dart';
import '../models/getTemplateData.dart';
import './dayTemplate.dart';

class AddCity extends StatefulWidget {
  final List<ListCard> list;
  AddCity(this.list);
  createState() => AddCityState(list);
}

class AddCityState extends State<AddCity> {
  String cityName;
  double height;
  double width;

  List<ListCard> list;
  AddCityState(this.list);

  build(context) {
    String key = "84e9366976ba919f475a47108c0de969";
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    var data;

    //Get Response
    getRes() async {
      GetResponse resp = new GetResponse(
          "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$key&units=metric");
      data = await resp.getResponse();

      if (data != null) {
        var obj = json.decode(data);
       
       String city=obj['name'];

       bool cout=true;
       for(int i=0;i<list.length;i++)
       {
         if(list[i].cityName==city)
            cout=false;
       }

       if(cout)list.add(new ListCard(cityName: city,object: obj));
      }
      // print("ddaa");
    }

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: height * .1,
              width: width,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
              child: TextField(
                  decoration: InputDecoration(
                    labelText: "Enter City",
                    filled: true,
                    errorMaxLines: 1,
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)),
                  ),
                  onChanged: (value) {
                    print(value);
                    cityName = value;
                  }),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: RaisedButton(
                child: Text(
                  "Add City",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Colors.white),
                ),
                color: Colors.lightBlue[500],
                splashColor: Colors.blue,
                onPressed: () {
                  setState(
                    () {
                      getRes().then((value) {
                        if (data == null) {
                          Navigator.of(context).pushReplacementNamed('Error');
                        } else {
                          var obj = json.decode(data);
                          print(data);

                          TemplateCreatingClass tc =
                              new TemplateCreatingClass(obj);
                          Vars v = tc.getTemplateData();

                          Navigator.of(context).pop();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DayTemplate(v, list)));
                        }
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
