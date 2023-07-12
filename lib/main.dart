import 'package:flutter/material.dart';
import 'package:waether_app/activity/home.dart';
import 'package:waether_app/activity/loading.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => loading(location: 'Gwalior'), //deafult route
        "/home": (context) => const home(),
      },
    ),
  );
}
