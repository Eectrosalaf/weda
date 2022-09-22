// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:weda/utilities/constant.dart';
import 'package:weda/services/weather.dart';
import 'cityscreen.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationweather});
  final locationweather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  String? weatherIcon;
  int? temperature;
  String? city;
  String? weathermessage;
  String? st;
  @override
  void initState() {
    super.initState();
    UIupdate(widget.locationweather);
  }

  void UIupdate(dynamic weatherdata) {
    setState(() {
      if (weatherdata == null) {
        temperature = 0;
        weatherIcon = "error";
        city = "";
        weathermessage = 'unable to get data';
        st = '';
        return;
      }
      double temp = weatherdata['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherdata['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      weathermessage = weather.getMessage(temperature!);

      city = weatherdata['name'];
      st = "in";
    });

    // print(temperature);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/abc.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherData = await weather.getlocData();
                      UIupdate(weatherData);
                    },
                    child: Icon(
                      Icons.near_me_sharp,
                      size: 30.0,
                    ),

                    //icon: FontAwesomeIcons.minus,
                  ),
                  FlatButton(
                    onPressed: ()async {
                      var typedname = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );
                    if(typedname!=null) {

                   var weatherData =await weather.getcityinfo(typedname);
                    UIupdate(weatherData);
                    }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 30.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weatherIcon',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$weathermessage $st $city!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
