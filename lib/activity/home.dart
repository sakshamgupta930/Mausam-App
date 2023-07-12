import 'dart:math';
import 'package:waether_app/activity/loading.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("init activity");
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    print("setstate activity");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dispose activity");
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    var city_name = ["mumbai", "delhi", "dhar", "indore", "pune"];
    final random = new Random();
    var city = city_name[random.nextInt(city_name.length)];

    Map info = ModalRoute.of(context)?.settings.arguments as Map;
    String temp = ((info['temp_value']).toString());
    String wind = ((info["air_speed_value"]).toString());
    if (temp == "NA" || wind == "NA") {
      print("NA");
    } else {
      temp = ((info['temp_value']).toString()).substring(0, 4);
      wind = ((info["air_speed_value"]).toString()).substring(0, 4);
    }
    String icon = info["icon_value"].toString();
    String description = info["des_value"];
    String location = (info["loc_value"]).toString();
    String humidity = info["hum_value"];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: GradientAppBar(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue.shade300,
              Colors.blue.shade800,
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
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
              children: [
                const SizedBox(height: 3),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if ((searchController.text).replaceAll(" ", "") ==
                              "") {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Blank Search"),
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => loading(
                                  location: searchController.text,
                                ),
                              ),
                            );
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 10, left: 0),
                          child: const Icon(
                            Icons.search,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search city like $city",
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.symmetric(horizontal: 22),
                          child: Row(
                            children: [
                              Image.network(
                                "https://openweathermap.org/img/wn/$icon@2x.png",
                              ),
                              const SizedBox(width: 20),
                              Column(
                                children: [
                                  Text(
                                    description,
                                    style: const TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "in $location",
                                    style: const TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 260,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 23, vertical: 15),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Icon(
                                  WeatherIcons.thermometer,
                                  size: 25,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Temperature",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(height: 35),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  temp,
                                  style: const TextStyle(fontSize: 90),
                                ),
                                const Text("C", style: TextStyle(fontSize: 30))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(20)),
                          margin: const EdgeInsets.fromLTRB(20, 0, 5, 0),
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    WeatherIcons.day_windy,
                                    size: 22,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Wind",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 30),
                              Text(
                                wind,
                                style: const TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold),
                              ),
                              const Text("km/hr"),
                            ],
                          )),
                    ),
                    Expanded(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20)),
                        margin: const EdgeInsets.fromLTRB(5, 0, 20, 0),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.humidity),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "Humidity",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            Text(
                              humidity,
                              style: const TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            const Text("percent"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Made By Saksham"),
                      Text("Data provides by openweathermap.org"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
