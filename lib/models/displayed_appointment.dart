import 'package:radis_demo/models/appointment.dart';

class DisplayedAppointment {
  Appointment appointment;
  bool isExpanded;

  DisplayedAppointment({this.appointment, this.isExpanded = false});
}