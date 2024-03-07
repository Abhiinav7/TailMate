import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationController extends ChangeNotifier{
  Position? Currentposition;
  LocationPermission? permission;
  String city=" ";
  getCurrentPosition() async {
    permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      String? citynew=placemarks[0].locality;
      String? district=placemarks[0].thoroughfare;

        Currentposition = position;
        notifyListeners();
        city=citynew!;
        notifyListeners();

      print("////////////////////////////${citynew}");
      print("////////////////////////////${district}");

    }catch(err){
      print("/////================///$err");
    }

  }
}