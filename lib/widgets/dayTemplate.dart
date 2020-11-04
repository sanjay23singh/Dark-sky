import 'package:DarkSkyy/models/listCard.dart';
import 'package:DarkSkyy/widgets/cityManagement.dart';
import 'dart:math';
import '../models/Vars.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class DayTemplate extends StatelessWidget {
  final Vars t;
  final List<ListCard> list;
  DayTemplate(this.t, this.list);
  final Random random = new Random();

  build(context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // backgroundColor:Color(0x44000000),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.location_city),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CityManagement(list)));
            }),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            //base column
            Column(
              children: [
                //Image wala container
                Container(
                  height: height,
                  width: double.infinity,
                  child: ClipPath(
                    child: Image.asset(
                     'assets/images/image${random.nextInt(9) + 1}.jpg',
                      fit: BoxFit.fill,
                    ),
                    clipper: MyClipper(),
                  ),
                ),
                //data wala container
                Container(
                  height: 550 + height * 0.16,
                  width: MediaQuery.of(context).size.width,
                  // width: double.infinity,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding:
                            EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        height: height * 0.16,
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left: 3),
                                child: Image.asset(
                                    'assets/images/sunriseSunset.png'),
                                height: height * .12,
                                width: height * .12,
                              ),
                              Expanded(
                                child: Container(
                                  // padding: EdgeInsets.only(left: 10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              child: Text(
                                                "Sunrise",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                "${t.sunRise}",
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              child: Text(
                                                "Sunset",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                "${t.sunSet}",
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            height: 250,
                            width: MediaQuery.of(context).size.width / 2,
                            padding: EdgeInsets.fromLTRB(10, 5, 3, 5),
                            child: Card(
                              elevation: 3,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    height: 130,
                                    child: Image.asset(
                                        'assets/images/pressure.png'),
                                  ),
                                  Container(
                                    height: 100,
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Container(
                                            child: Text(
                                          "Pressure",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w400),
                                        )),
                                        Container(
                                          child: Text("${t.pressure} Pa",
                                              style: TextStyle(
                                                fontSize: 18,
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 250,
                            width: MediaQuery.of(context).size.width / 2,
                            padding: EdgeInsets.fromLTRB(10, 5, 3, 5),
                            child: Card(
                              elevation: 3,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    height: 130,
                                    child: Image.asset(
                                        'assets/images/humidity.png'),
                                  ),
                                  Container(
                                    height: 100,
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Container(
                                            child: Text(
                                          "Humidity",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w400),
                                        )),
                                        Container(
                                          child: Text("${t.humidity}%",
                                              style: TextStyle(
                                                fontSize: 18,
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            height: 250,
                            width: MediaQuery.of(context).size.width / 2,
                            padding: EdgeInsets.fromLTRB(10, 5, 3, 5),
                            child: Card(
                              elevation: 3,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    height: 130,
                                    child: Image.asset(
                                        'assets/images/visibility.png'),
                                  ),
                                  Container(
                                    height: 100,
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Container(
                                            child: Text(
                                          "Visibility",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w400),
                                        )),
                                        Container(
                                          child: Text("${t.visibility} Km",
                                              style: TextStyle(
                                                fontSize: 18,
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 250,
                            width: MediaQuery.of(context).size.width / 2,
                            padding: EdgeInsets.fromLTRB(10, 5, 3, 5),
                            child: Card(
                              elevation: 3,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    height: 130,
                                    child:
                                        Image.asset('assets/images/cloud.png'),
                                  ),
                                  Container(
                                    height: 100,
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Container(
                                            child: Text(
                                          "Clouds",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w400),
                                        )),
                                        Container(
                                          child: Text("${t.cloudiness}%",
                                              style: TextStyle(
                                                fontSize: 18,
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              top: height * .12,
              left: width * .08,
              child: Container(
                width: width * .3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //continer for sunny rainy etc
                    Container(
                      child: AutoSizeText(
                        t.main,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        presetFontSizes: [45, 30, 35, 30, 25, 20],
                        maxLines: 1,
                      ),
                    ),
                    Container(
                      child: AutoSizeText(
                        "${t.temp}°",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        presetFontSizes: [80, 60, 50, 40],
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: height * .60,
              child: Container(
                height: height * .2,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Icon(Icons.location_on),
                                padding: EdgeInsets.only(right: 10),
                              ),
                              Expanded(
                                child: Container(
                                  child: AutoSizeText(
                                    "${t.city}",
                                    presetFontSizes: [
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
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  t.country,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "${t.minTemp}/${t.maxTemp}°C",
                                  style: TextStyle(fontSize: 20),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: height * .83,
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                height: height * 0.16,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Image.asset('assets/images/wind.png'),
                        height: height * .12,
                        width: height * .12,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "Wind Speed",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w300),
                              ),
                            ),
                            Container(
                              child: Text(
                                "${t.windSpeed}m/s",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 15),
                        child: Text(
                          "${t.windDir}°N",
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    var path = Path();

    path.lineTo(width, 0);
    path.lineTo(width, height * .65);
    path.quadraticBezierTo(width / 2, height * .70, 0, height * .65);
    // path.lineTo(0, height*.65);
    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
