import 'package:flutter/material.dart';

class Appointment {
  final String room;
  final String event;
  final int time;

  const Appointment({
    @required this.room,
    @required this.event,
    @required this.time,
  });
}
