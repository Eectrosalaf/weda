import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 70.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const ktextfdecoration =  InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(12),

      ),
      borderSide: BorderSide.none,
    ),
    filled: true,
    fillColor: Colors.white,
    icon: Icon(FontAwesomeIcons.locationCrosshairs),
    hintText: 'Enter city name',
    hintStyle: TextStyle(color: Colors.grey));
