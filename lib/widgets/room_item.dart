import 'package:flutter/material.dart';

class RoomItem extends StatelessWidget {
  final String event;
  final int appointmentTime;

  RoomItem(this.event, this.appointmentTime);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(event),
            Text(appointmentTime.toString()),
          ],
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
