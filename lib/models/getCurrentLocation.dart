import 'package:geolocator/geolocator.dart';

class GetLocation {
  double latitude=-1;
  double longitude=-1;

  Future<void> getLocation() async {
    // print("B");

    try{
    Position position =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);

        if(position!=null)
        {
          latitude=position.latitude;
          longitude=position.longitude;
        }
    }catch(e)
    {
      print(e);
    }
        // print("C");
  }
}
