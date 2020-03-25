import 'package:flutter/material.dart';
import 'package:radis_demo/dummy_data.dart';
import 'package:radis_demo/screens/room_screen.dart';
import 'package:radis_demo/widgets/dropdown_widget.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String room ;

  final roomData = DUMMY_PATIENTS;

  void selectRoom(BuildContext context, String room) {
    Navigator.of(context).pushNamed(RoomScreen.routeName, arguments: {
      'roomData': roomData,
    });
  }

  @override
  Widget build(BuildContext context) {
    var rooms = roomData.map((x) => x.room).toList();
    return Scaffold(
        appBar: AppBar(title: Text('Room Diary')),
        body: Column(
          children: <Widget>[
            Text('Help Me!'),
            DropdownWidget(
                title: 'Select Room',
                items: <String>['Room 1', 'Room 2'],//rooms,
                currentItem: 'Room 1',//rooms[0],
                hintText: 'Select Room',
                itemCallBack: (String room) {
                  setState(() {
                    this.room = room;
                  });
                  }),
            RaisedButton(
                onPressed: () => selectRoom(context, room),
                child: Text('Check Room Diary')),
          ],
        ));
  }
}
