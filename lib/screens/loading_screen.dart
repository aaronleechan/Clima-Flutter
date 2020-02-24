import 'dart:convert';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

const spinkit = SpinKitRotatingCircle(
  color: Colors.white,
  size: 50.0,
);

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();

  }

  @override
  void deactivate() { //WHen stateful widget destroy
    // TODO: implement deactivate
    super.deactivate();
    print(" deactivate Destroy");
  }

  void getLocation() async{
    var weatherData = await WeatherModel().getLocationWeather();
    try{
      Navigator.push(context,MaterialPageRoute(builder: (context){
        return LocationScreen(
            locationWeather: weatherData,
        );
      },),);
    }catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    print("Build Call!!!!");
    return Scaffold(
      body: Center(
        child: spinkit
      ),
    );
  }
}
