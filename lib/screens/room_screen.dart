import 'package:flutter/material.dart';
import 'package:radis_demo/models/appointment.dart';
import 'package:radis_demo/models/displayed_appointment.dart';
import 'package:radis_demo/widgets/appointment_list.dart';
import 'package:radis_demo/widgets/room_item.dart';

import '../dummy_data.dart';

class RoomScreen extends StatefulWidget {
  static const routeName = '/room';
  @override
  _RoomScreenState createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  var startOfDay = 9;
  var endOfDay = 17;
  var title = '';
  List<Widget> listOfAppointments;
  List<DisplayedAppointment> displays;
  var loadedInitData = false;

  @override
  void initState() {
    listOfAppointments = new List<Widget>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!loadedInitData) {
      final routeArgs = ModalRoute.of(context).settings.arguments
          as Map<String, List<Appointment>>;
      final roomData = routeArgs['roomData'];
      title = roomData[0].room;
      displays = roomData
          .map((x) => new DisplayedAppointment(appointment: x))
          .toList();
      loadedInitData = true;
    }

    void _changeExpandState(int index, bool isExpanded) {
      setState(() {
        displays[index].isExpanded = !isExpanded;
        print('INDEX : $index $isExpanded');
      });
    }

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Theme(
              data: Theme.of(context)
                  .copyWith(cardColor: Theme.of(context).primaryColor),
              child: Appointment_List(
                displays: displays,
                changeExpandedState: _changeExpandState,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
