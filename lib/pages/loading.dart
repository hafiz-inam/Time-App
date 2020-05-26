import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:worldtime/services/WorldTime.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'loading...';

  void getWorldTime() async{
    WorldTime object = WorldTime(location: 'Karachi', flag:'Pakistan.png', url:'Asia/Karachi');
    await object.getTime();
    time = object.time;
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': object.location,
      'flag': object.flag,
      'time': object.time,
      'isDayTime': object.isDayTime});
  }
  void initState(){
    super.initState();
    getWorldTime();
    print("init state ran");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitRing(
          color: Colors.black,
          size: 100.0,
        ),
      )
    );
  }
}