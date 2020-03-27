import 'package:flutter/material.dart';

class Appointment {
  final String room;
  final String requestId;
  final String startDate;
  final String description;
  final String dateOfBirth;
  final String radisNumber;
  final String forename;
  final String surname;
  final String hospitalNumber;
  final int startTime;
  final String event;
  final int endTime;

  const Appointment({
  @required this.room,
  @required this.requestId,
  @required this.startDate,
  @required this.description,
  @required this.dateOfBirth,
  @required this.radisNumber,
  @required this.forename,
  @required this.surname,
  @required this.hospitalNumber,
  @required this.startTime,
  @required this.event,
  @required this.endTime,
  });
}
