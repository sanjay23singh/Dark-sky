import 'dart:math';

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ErrorPage extends StatelessWidget {
  build(context) {
    double ht = MediaQuery.of(context).size.height;
    double wd = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: ht * .15,
              width: wd,
            ),
            Container(
              height: ht * .45,
              width: wd,
              child: Center(
                child: Image.asset(
                  'assets/images/oops.jpg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(03),
              alignment: Alignment.center,
              height: max(40, ht*.1),
              width: wd,
              child: AutoSizeText(
                'OOPS! Something went wrong',
                presetFontSizes: [100,90,80,70,60,55,50,45,40,35,30,24, 20, 14],
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
                maxLines: 1,
              ),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(min(20, wd*.1), 04, min(20,wd*.1), 04),
              alignment: Alignment.topCenter,
              height: max(60, ht*.3),
              width: wd,
              child: AutoSizeText(
                'Try opening your data connection and location settings.Then exit the app and restart again.',
                presetFontSizes: [70,60,55,50,40,35,30,35,30,28,26,24,22,20,18,16, 14,12,10,8,6,4,2],
                maxLines: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
