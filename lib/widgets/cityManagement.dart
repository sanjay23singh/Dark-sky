import 'package:DarkSkyy/models/listCard.dart';
import 'dart:math';
import '../models/Vars.dart';
import 'package:DarkSkyy/widgets/AddCity.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../models/getTemplateData.dart';
import 'dayTemplate.dart';

class CityManagement extends StatefulWidget {
  final List<ListCard> list;
  CityManagement(this.list);
  createState() => _CityManagementState(list);
}

class _CityManagementState extends State<CityManagement> {
  double ht;
  double wt;
  List<ListCard> list;
  _CityManagementState(this.list);
  Random random = new Random();
// int randomNumber = random.nextInt(100);
  build(context) {
    ht = MediaQuery.of(context).size.height;
    wt = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddCity(list)));
            },
          ),
        ],
      ),
      body: Container(
        height: ht,
        width: wt,
        child:list.length>0? ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            final city = list[index].cityName;
            return Dismissible(
              background: Container(color: Colors.red),
              key: Key(list[index].cityName),
              onDismissed: (direction) {
                setState(() {
                  list.removeAt(index);
                });

                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text("$city removed")));
              },
              child: Card(
                child: GestureDetector(
                  onTap: () {
                    TemplateCreatingClass tc =
                        new TemplateCreatingClass(list[index].object);
                    Vars v = tc.getTemplateData();

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DayTemplate(v, list)));
                  },
                  child: Container(
                    height: 150,
                    width: wt,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/images/plain${random.nextInt(6) + 1}.jpg',
                        ),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 20,
                          right: 30,
                          child: Container(
                            height: 60,
                            child: AutoSizeText(
                              "${list[index].object['main']['temp_max'].toInt()}°C",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              presetFontSizes: [80, 60, 50, 40],
                              maxLines: 1,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 30,
                          child: Container(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            width: wt,
                            child: AutoSizeText(
                              list[index].cityName,
                              style: TextStyle(color: Colors.white),
                              presetFontSizes: [
                                40,
                                35,
                                30,
                                28,
                                26,
                                24,
                                22,
                                20,
                                18,
                                12
                              ],
                              maxLines: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ):Center(
          child: AutoSizeText(
                        "No cities added !",
                        style: TextStyle(
                          // color: Colors.white,
                        ),
                        presetFontSizes: [ 30, 35, 30, 25, 20],
                        maxLines: 1,
                      ),
        ),
      ),
    );
  }
}
