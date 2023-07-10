import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/firebase/firebase_function.dart';
import 'package:todo/model/task_model.dart';

import '../update_task.dart';

class TaskWidget extends StatelessWidget {
  TaskModel taskModel;
  TaskWidget(this.taskModel);
  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(motion: DrawerMotion(), children: [
        SlidableAction(
          onPressed: (context) {
            FirebaseFunction.deletTask(taskModel.id);
          },
          icon: Icons.delete,
          backgroundColor: Colors.red,
          label: 'Delet',
        ),
        SlidableAction(
          onPressed: (context) {
            Navigator.pushNamed(context, UpdateTask.routName,
            arguments: taskModel
            );
          },
          backgroundColor: Theme.of(context).primaryColor,
          icon: Icons.edit,
          label: 'Edit',
        )
      ]),
      child: SizedBox(
        height: 90,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          margin: EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 70,
                child: VerticalDivider(
                  width: 30,
                  thickness: 3,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskModel.title,
                    style: taskModel.status?
                    Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.green
                    ):
                    Theme.of(context).textTheme.bodyMedium,

                  ),
                  Text(
                      taskModel.description,
                      style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
              Spacer(),
              taskModel.status?Text(
                  'Done!',style: TextStyle(color: Colors.green),)
                  :InkWell(
                onTap: (){
                  taskModel.status=true;
                  FirebaseFunction.updateTask(taskModel.id,
                      taskModel);
                },
                    child: Container(
                    margin: EdgeInsets.only(right: 12),
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Icon(
                      Icons.done,
                      size: 25,
                      color: Colors.white,
                    )),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
