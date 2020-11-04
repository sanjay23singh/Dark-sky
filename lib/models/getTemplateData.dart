import 'package:DarkSkyy/models/Vars.dart';

class TemplateCreatingClass
{
  var obj;
  TemplateCreatingClass(this.obj);

  Vars  getTemplateData()
  {
    Vars v=new Vars(

      main: obj['weather'][0]['main'],
      description: obj['weather'][0]['description'],

      temp: obj['main']['temp'].toInt(),
      maxTemp:  obj['main']['temp_max'].toInt(),
      minTemp:  obj['main']['temp_min'].toInt(),
      feelsLike: obj['main']['feels_like'].toInt(),

      humidity: obj['main']['humidity'],
      pressure:  obj['main']['pressure'],
      visibility: (obj['visibility']/1000).toStringAsFixed(2),

      windDir: obj['wind']['deg'],
      windSpeed: (obj['wind']['speed']).toStringAsFixed(2),

      cloudiness: obj['clouds']['all'],
      
      country: obj['sys']['country'],
      city: obj['name'],
        
      sunRise: DateTime.fromMillisecondsSinceEpoch(obj['sys']['sunrise']*1000).toString().substring(11,16),
      sunSet: DateTime.fromMillisecondsSinceEpoch(obj['sys']['sunset']*1000).toString().toString().substring(11,16),

    );
    return v;
  }
}