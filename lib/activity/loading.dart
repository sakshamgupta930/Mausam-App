import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:waether_app/worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// ignore: camel_case_types, must_be_immutable
class loading extends StatefulWidget {
  String location;
  loading({super.key, required this.location});

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {
  String? temp;
  String? hum;
  String? air_speed;
  String? des;
  String? main;
  String? icon;

  // String temperature = "loading";
  void startapp() async {
    worker instance = worker(loc: widget.location);
    await instance.getdata();
    temp = instance.temp;
    hum = instance.humidity;
    air_speed = instance.air_speed;
    des = instance.description;
    main = instance.main;
    icon = instance.icon;

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        "temp_value": temp,
        "hum_value": hum,
        "air_speed_value": air_speed,
        "des_value": des,
        "main_value": main,
        "icon_value": icon,
        "loc_value": widget.location,
      });
    });
  }

  @override
  void initState() {
    super.initState();
    startapp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blue.shade800,
                Colors.blue.shade200,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'images/logo.json',
                height: 200,
                width: 150,
              ),
              const Text(
                "Mausam App",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SpinKitWanderingCubes(
                shape: BoxShape.circle,
                color: Colors.white,
                size: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
