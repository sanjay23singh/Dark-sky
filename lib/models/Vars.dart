import 'package:flutter/foundation.dart';
class Vars
{
  @required String main;
  @required String description;

  @required int temp;
  @required int minTemp;
  @required int maxTemp;
  @required int feelsLike;

  @required int pressure;
  @required int humidity;
  @required String visibility;
  
  @required String windSpeed;
  @required int windDir;
  
  @required int cloudiness;
  
  @required String country;
  @required String city;

  @required String sunRise;
  @required String sunSet;

  @required Vars({this.visibility,this.city,this.cloudiness,this.country,this.windDir,this.description,this.feelsLike,this.humidity,this.main,this.maxTemp,this.minTemp,this.pressure,this.sunRise,this.sunSet,this.temp,this.windSpeed});
}

//print( ());


