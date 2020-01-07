import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {
    //retrieve args
    data = data.isEmpty ? ModalRoute.of(context).settings.arguments : data;
    String bgImage = data["isDaytime"] ? "day.webp" : "night.webp";

    List<Color> colorSchemeCustom = data["isDaytime"] ? [Colors.lightBlueAccent, Colors.pink[400], Colors.cyan[200]]:[Colors.deepPurple[300], Colors.orange,Colors.grey[200]] ;
    return Scaffold(
      backgroundColor: colorSchemeCustom[0],
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/animations/$bgImage"),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async {
                    dynamic updatedData = await Navigator.pushNamed(context, "/location");// Routes get pushed to the route stack
                    if (updatedData != null){
                      setState(() {
                        data = {
                          "location": updatedData["location"],
                          "flag": updatedData["flag"],
                          "time": updatedData["time"],
                          "isDaytime": updatedData["isDaytime"]
                        };
                      });
                    }
                  },
                    icon: Icon(
                      Icons.edit_location,
                      color: colorSchemeCustom[1] ,
                    ),
                    label: Text("Edit Location", style: TextStyle(color: colorSchemeCustom[1]),),
                ),
                SizedBox(height:20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data["location"],
                      style: TextStyle(
                        fontSize: 28,
                        letterSpacing: 2,
                        color: colorSchemeCustom[2],
                      )
                    ),
                  ],
                ),
                SizedBox(height:20),
                Text(
                  data["time"],
                  style: TextStyle(
                    fontSize: 66,
                    color: colorSchemeCustom[2]
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