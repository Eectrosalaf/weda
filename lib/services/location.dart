

// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
class Location {

  double ? latitude;
  double ? longitude;

 Future<void>  getNewLocation() async {
    try {
      Position? position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      latitude=position.latitude;
      longitude=position.longitude;
    } catch (e) {
      print(e);
    }
  }

}



