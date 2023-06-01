import 'package:flutter/material.dart';

const temptextstyle  = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const messagetextstyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 70.0
);

const buttontextstyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 20.0,
  color: Colors.yellow,
);

const conditiontextstyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 80.0,
);

const textfielddecoration = InputDecoration(
  filled: true,
  fillColor: Colors.transparent,
  border: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.red,
      width: 5.0,
      style: BorderStyle.solid,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(20.0),
    ),
  ),
  icon: Icon(
    Icons.location_city_sharp,
    color: Colors.red,
    size: 50.0,
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Colors.black54,
  ),
  labelText: 'Search City Name',
);