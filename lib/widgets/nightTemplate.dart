import 'package:DarkSkyy/models/Vars.dart';
import 'package:flutter/material.dart';

double _ht;
double _wt;

class NightTemplate extends StatelessWidget {
  final Vars v;
  NightTemplate(this.v);
  
  build(context) {
    _ht = MediaQuery.of(context).size.height;
    _wt = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          height: _ht * 2,
          width: _wt,
          child: Stack(
            children: [
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  width: _wt,
                  child: Image.asset('assets/gifs/thunder.gif',
                  fit: BoxFit.fitWidth,
                  ),
                ),
              ),

              //FOR  Temperature
              Positioned(
                top: _ht * .68,
                left: _wt * .08,
                child: Container(
                  height: 100,
                  width: 150,
                  child: FittedBox(
                    child: Text(
                      "${v.temp}°C",
                      style: TextStyle(
                          color: Colors.white,
                          // fontSize: 50,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),

              //for max-min
              Positioned(
                top: _ht * .78,
                left: _wt * .08,
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  height: 50,
                  width: 150,
                  child: FittedBox(
                    child: Text(
                      "min/max ${v.minTemp}/${v.maxTemp}",
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ),

              //for clouds

              Positioned(
                top: _ht * .44,
                right: 10,
                child: Container(
                  height: 120,
                  width: 160,
                  child:
                      FittedBox(child: Image.asset('assets/images/cloudy.jpg')),
                ),
              ),

              //for weather info
              Positioned(
                top: _ht * .60,
                right: 10,
                child: Container(
                  height: 30,
                  width: 160,
                  child: FittedBox(
                    alignment: Alignment.center,
                    child: Text(
                      v.main,
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ),

              //for Area Name
              Positioned(
                top: _ht * .90,
                left: _wt * .08,
                child: Container(
                  height: 40,
                  width: 270,
                  child: FittedBox(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      v.city,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//MyClipper Class
class MyClipper extends CustomClipper<Path> {
  double c1x = _wt * .27;
  double c2x = _wt * .76;

  double c1y = _ht * .52;
  double c2y = _ht * .35;

  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, 0);
    path.lineTo(0, _ht * 0.44);
    path.quadraticBezierTo(c1x, c1y, _wt * 0.55, _ht * .43);
    path.quadraticBezierTo(c2x, c2y, _wt, _ht * .40);
    path.lineTo(_wt, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
