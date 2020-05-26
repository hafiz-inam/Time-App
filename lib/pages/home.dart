import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data  : ModalRoute.of(context).settings.arguments;
    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    print(data);
    return SafeArea(
      child: Scaffold(
        body: Container(
            decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120,0,0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async{
                   dynamic result = await Navigator.pushNamed(context,'/location');
                   print(result['time']);
                   setState(() {
                     data = {
                       'location': result['location'],
                       'flag': result['flag'],
                       'time': result['time'],
                       'isDayTime': result['isDayTime']
                     };
                   });
                   },
                  icon: Icon(
                    Icons.edit_location),
                    color: Colors.white,
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                    ))),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ),
                    ),
                ],),
                SizedBox(height: 20.0,),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    color: Colors.white,
                  ),
                ),
            ],),
          ),
        ),
      ),
    );
  }
}
