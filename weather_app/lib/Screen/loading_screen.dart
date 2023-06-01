import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/Screen/location_screen.dart';
import 'package:weather_app/Services/location.dart';
import 'package:weather_app/Services/networking.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    delay();
    getlocation();
  }

  Future<void> delay() async {
    Location location = Location();
    await location.getcurrentloaction();
    await Future.delayed(Duration(seconds: 4));
  }

  void getlocation() async {
    Networking networking = Networking();
    var weatherdata = await networking.apidata();
    if (weatherdata != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return LocationScreen(
            Locationweather: weatherdata,
          );
        }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitThreeInOut(
          color: Colors.grey[400],
          size: 50.0,
        ),
      ),
    );
  }
}
