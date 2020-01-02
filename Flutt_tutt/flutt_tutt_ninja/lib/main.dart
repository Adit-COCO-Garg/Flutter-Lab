import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MaterialApp(
  home: Test(),
)
);


class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text("Aye"),
      centerTitle: true,
      backgroundColor: Colors.red[600],
    ),
    body: 
      Row(
        children: <Widget>[
          Expanded(
            child: Image.asset("Assets/1.jpg"),
            flex:3,
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(30),
              color: Colors.cyanAccent,
              child: Text("1"),
            ),
          ),
          Expanded(
            flex:1,
            child: Container(
              padding: EdgeInsets.all(30),
              color: Colors.amberAccent,
              child: Text("2"),
            ),
          ),
          Expanded(
            flex:1,
            child: Container(
              padding: EdgeInsets.all(30),
              color: Colors.pinkAccent,
              child: Text("3"),
            ),
          )
        ],
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text("click"),
        backgroundColor: Colors.red[600],
      ),
  );
  }
}