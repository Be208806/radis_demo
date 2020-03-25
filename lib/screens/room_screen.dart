import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String,Object>;
    final roomData = routeArgs['roomData'];
    title = roomData;
    listOfAppointments = new List<Widget>();
    for (int i = startOfDay; i <= endOfDay; i++) {
      var currentAppointment = DUMMY_PATIENTS.firstWhere((x) => x.time == i,orElse:() => null);
      Widget currentRow = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          (currentAppointment != null? RoomItem(currentAppointment.event,
              currentAppointment.time):Container(height: 100,)),
              Text(i.toString() + ':00'),
          Divider(),
        ],
      );
      listOfAppointments.add(currentRow);
    }
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: GridView(padding: const EdgeInsets.all(25),
                  children: listOfAppointments,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 2000,childAspectRatio: 2.5,crossAxisSpacing: 20,mainAxisSpacing: 0),
          ),
        );
        // GridView(
        //   padding: const EdgeInsets.all(25),
        //   children: hoursOfDay
        //       .map((appData) {
        //         var currentAppointment =
        //           RoomItem(appData.forename, appData.surname, appData.time)
        //       },)
        //       .toList(),
        //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        //     maxCrossAxisExtent: 2000,
        //     childAspectRatio: 3,
        //     crossAxisSpacing: 20,
        //     mainAxisSpacing: 20,
        //   ),
        // ),
  }
}
