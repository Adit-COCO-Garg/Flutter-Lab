/// data req over http and dart package for covert stuff
import "package:http/http.dart";
import "dart:convert";
import "package:intl/intl.dart";

class WorldTime {
  String location; // location name UI
  String time; // time UI
  String flag; // url flag icon UI
  String url = "http://worldtimeapi.org/api/timezone/"; // query url for api endpoint - worldTime API http://worldtimeapi.org/
  String query; // queries to be added

  WorldTime({this.location, this.flag, this.url});

  /// Calls api and requests location specific times
  Future<void> getTime() async{
    try{
      // request and store in [response]
      Response response = await get("http://worldtimeapi.org/api/timezone/America/New_York");
      // convert response string to Dart Map
      Map data = jsonDecode(response.body);
      // Parse MAP data into fields
      String dateTime = data["datetime"];
      String strOffset = data["utc_offset"];

      // parse datetime fields into DateTime Obj
      DateTime now = DateTime.parse(dateTime);
      List<int> offset = strOffset.substring(1).split(":").map((temp) => int.parse(temp)).toList();

      // check offset if it's ahead or behind and then add/ subtract based on that
      // now is indestructible - redeclare
      strOffset.substring(0,1) == "+" ? now = now.add(Duration(hours:offset[0],minutes: offset[1] )) : now = now.subtract(Duration(hours:offset[0],minutes: offset[1]));

      // set time prop
      time = DateFormat.jm().format(now);
    }
    catch(e){
      print("error caught $e");
      time = "could not get time data";
    }

  }
}