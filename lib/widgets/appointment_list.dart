import 'package:flutter/material.dart';
import 'package:radis_demo/models/displayed_appointment.dart';

class Appointment_List extends StatelessWidget {
  const Appointment_List({
    Key key,
    @required this.displays,
    @required this.changeExpandedState,
  }) : super(key: key);

  final List<DisplayedAppointment> displays;
  final Function changeExpandedState;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(borderRadius: BorderRadius.all(Radius.circular(15)),
          child:  ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            changeExpandedState(index, isExpanded);
          },
          // expansionCallback: (int index, bool isExpanded) {
          //   setState(() {
          //     displays[index].isExpanded = !isExpanded;
          //     print('INDEX : $index $isExpanded');
          //   });
          //},
          children: displays.map<ExpansionPanel>((DisplayedAppointment item) {
            return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                    title: Text(item.appointment.event),
                    subtitle: Text(item.appointment.startTime.toString() + ':00'),
                );
              },
              body: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(15)),
                              child: ListTile(
                    title: Text(item.appointment.forename),
                    subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[Text(item.appointment.startDate),Text(item.appointment.surname)],),
                  ),
              ),
              isExpanded: item.isExpanded,
            );
          }).toList(),
        ),
    );
  }
}