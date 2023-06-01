import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/Screen/location_screen.dart';
import 'package:weather_app/Utilities/constant.dart';

class cityscreen extends StatefulWidget {
  @override
  _cityscreenState createState() => _cityscreenState();
}

class _cityscreenState extends State<cityscreen> {
  late String cityname;
  var entername;
  checktextfield(BuildContext, context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Enter City Name'),
            content: Text('Invalid City Name'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, 'Ok');
                },
                child: Text('Ok'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/search.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.white54, BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LocationScreen();
                        },
                      ),
                    );
                  },
                  child: Icon(
                    Icons.arrow_back_ios_sharp,
                    size: 30.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: textfielddecoration,
                  cursorColor: Colors.black,
                  mouseCursor: MouseCursor.defer,
                  enableSuggestions: true,
                  onChanged: (value) {
                    cityname = value;
                  },
                  onSubmitted: (value) {
                    Navigator.pop(context, cityname);
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, cityname);
                },
                onLongPress: () {
                  if (cityname == '') {
                    checktextfield(context, context);
                  }
                },
                child: Text(
                  'GET WEATHER',
                  style: buttontextstyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
