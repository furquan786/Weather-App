import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/icon.dart';
import 'package:weather_app/Screen/city_screen.dart';
import 'package:weather_app/Services/networking.dart';
import 'package:weather_app/Services/weather.dart';
import 'package:weather_app/Utilities/constant.dart';

class LocationScreen extends StatefulWidget {
  final Locationweather;
  LocationScreen({this.Locationweather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
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

  Weathermodel weather = Weathermodel();
  Networking networking = Networking();
  late String weathericon;
  late int temprature;
  late String cityname;
  late String weathermessage;

  @override
  void initState() {
    super.initState();
    updateUI(widget.Locationweather);
  }

  void updateUI(dynamic jsondata) {
    setState(() {
      if (jsondata == null) {
        temprature = 0;
        weathericon = 'Error';
        weathermessage = 'Unable to get weather data';
        cityname = '';
        return;
      }
      var condition = jsondata['weather'][0]['id'];
      double temp = jsondata['main']['temp'];
      temprature = temp.toInt();
      weathermessage = weather.getMessage(temprature);
      weathericon = weather.getWeatherIcon(condition);
      cityname = jsondata['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/weather.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.white54, BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () async {
                      var mylocation = await networking.apidata();
                      updateUI(mylocation);
                    },
                    child: Icon(
                      Icons.near_me_sharp,
                      size: 50.0,
                      color: Colors.red,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typedname = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return cityscreen();
                          },
                        ),
                      );
                      if (typedname != null) {
                        var citydata =
                            await networking.getcityweather(typedname);
                        updateUI(citydata);
                      } else {
                        checktextfield(BuildContext, context);
                      }
                    },
                    child: Icon(
                      Icons.search_sharp,
                      size: 50.0,
                      color: Colors.grey[350],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Text(
                      '$temprature°',
                      style: temptextstyle,
                    ),
                    Text(
                      weathericon,
                      style: conditiontextstyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "$weathermessage in $cityname !",
                  textAlign: TextAlign.right,
                  style: messagetextstyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
