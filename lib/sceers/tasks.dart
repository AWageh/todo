import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo/sceers/widget/task_widget.dart';

class TasksScreen extends StatefulWidget {
  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        DatePicker(
          DateTime.now(),
          initialSelectedDate: DateTime.now(),
          selectionColor: Theme.of(context).primaryColor,
          selectedTextColor: Colors.white,
          height: 100,
          dateTextStyle: TextStyle(fontSize: 12),
          dayTextStyle: TextStyle(fontSize: 12),
          monthTextStyle: TextStyle(fontSize: 12),
          onDateChange: (newdate) {
            // New date selected
            setState(() {
              date = newdate;
            });
          },
        ),
        SizedBox(height: 15),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 15),
            itemCount: 5,
              itemBuilder: (context,index){
                return TaskWidget();
              }),
        ),
      ],
    );
  }
}
