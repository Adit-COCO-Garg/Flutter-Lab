import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';
import "package:world_time/pages/home.dart";
import 'package:world_time/pages/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: "/", //override initial route - testing
  routes: { // app navigation defined
    "/": (context)=> Loading(),
    "/home": (context)=> Home(),
    "/location": (context)=> ChooseLocation(),
  },
));



