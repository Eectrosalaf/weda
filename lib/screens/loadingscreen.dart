// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors, avoid_print, use_build_context_synchronously, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'locationscreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weda/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationdata();
  }

  void getLocationdata() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await WeatherModel().getlocData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationweather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(

          children: <Widget>[
            Expanded(
              child: SpinKitDoubleBounce(
                size: 60,
                color: Colors.blueGrey,
                // duration: Duration(),
              ),
            ),
      ]
    )
    )
    );
  }
}
