import 'package:flutter/material.dart';
import 'package:radis_demo/dummy_data.dart';
import 'package:radis_demo/screens/room_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String room = 'Room 1';

  final roomData = DUMMY_PATIENTS;

  void selectRoom(BuildContext context, String room) {
    Navigator.of(context).pushNamed(RoomScreen.routeName, arguments: {
      'roomData': roomData.where((x)=>x.room == room).toList(),
    });
  }

  @override
  Widget build(BuildContext context) {
    var rooms = roomData.map((x) => x.room).toList();
    return Scaffold(
        appBar: AppBar(title: Text('Room Diary')),
        body: Column(
          children: <Widget>[
            DropdownButton<String>(
              value: room,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: Theme.of(context).textTheme.title,
              underline: Container(
                height: 2,
                color: Theme.of(context).appBarTheme.color,
              ),
              onChanged: (String newValue) {
                setState(() {
                  room = newValue;
                });
              },
              items: rooms
                  .toSet()
                  .toList()
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            RaisedButton(
                onPressed: () => selectRoom(context, room),
                child: Text('Check Room Diary')),
          ],
        ));
  }
}
