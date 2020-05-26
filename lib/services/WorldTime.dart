import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location;
  String flag;
  String url;
  String time;
  bool isDayTime;

  WorldTime({this.location, this.flag, this.url, this.isDayTime});

  void getTime() async{
    try {
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      DateTime datetime = DateTime.parse((data['datetime']));
      String offset = data['utc_offset'].substring(1, 3);
      DateTime now = datetime.add((Duration(hours: int.parse(offset))));
      time = DateFormat.jm().format(now);
      isDayTime = now.hour > 6 && now.hour < 19 ? true : false;
    }
    catch(e){
      print('caught an error:$e');
      time = 'could not get the time';
    }
  }
}