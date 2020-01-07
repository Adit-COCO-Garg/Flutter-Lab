import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:world_time/services/world_time.dart";

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async{
    WorldTime inst = WorldTime(location: "New_York", flag: "usa.png", query: "America/New_York");
    await inst.getTime();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "location": inst.location,
      "flag": inst.flag,
      "time": inst.time,
      "isDaytime": inst.isDaytime
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlareActor("assets/animations/earth.flr",

        ),
      ),
    );
  }
}
