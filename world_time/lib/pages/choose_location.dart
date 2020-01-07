import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(query: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(query: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(query: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(query: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(query: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(query: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(query: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(query: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index)async {
    WorldTime inst = locations[index];
    await inst.getTime();
    //nav to home screen
    Navigator.pop(context,{
      "location": inst.location,
      "flag": inst.flag,
      "time": inst.time,
      "isDaytime": inst.isDaytime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Choose a location'),
        centerTitle:true,
        elevation:0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/${locations[index].flag}"),
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
