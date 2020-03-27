import 'package:flutter/material.dart';
import 'package:radis_demo/models/appointment.dart';
import 'package:radis_demo/models/displayed_appointment.dart';
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
    // for (int i = startOfDay; i <= endOfDay; i++) {
    //   var currentAppointment = roomData.firstWhere((x) => x.time == i,orElse:() => null);
    //   Widget currentRow = Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: <Widget>[
    //     //  (currentAppointment != null?
    //       RoomItem(currentAppointment.event,
    //           currentAppointment.time),
    //           //:Container(//height: 100,
    //          // )),
    //         //  Text(i.toString() + ':00'),
    //       Divider(),
    //     ],
    //   );
    //   listOfAppointments.add(currentRow);
    // }
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      // body: ExpansionPanelList(children: displays.map((DisplayedAppointment displayed) {

      //   return new ExpansionPanel(headerBuilder: (BuildContext context, bool isExpanded) {
      //     return Text('Placeholder');
      //   }, isExpanded: displayed.isExpanded, body: Text('Body'));
      // }).toList(),

      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                displays[index].isExpanded = !isExpanded;
                print('INDEX : $index $isExpanded');
              });
            },
            children: displays.map<ExpansionPanel>((DisplayedAppointment item) {
              return ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text(item.appointment.event),
                  );
                },
                body: ListTile(
                  title: Text(item.appointment.forename),
                ),
                isExpanded: item.isExpanded,
              );
            }).toList(),
          ),
        ),
      ]),
    );

    //  GridView(padding: const EdgeInsets.all(25),
    //           children: roomData.map((room)=> Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: new RoomItem(room.event,room.startTime),
    //           )).toList(),
    //
  }
}
