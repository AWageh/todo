import 'package:flutter/material.dart';
import 'package:todo/firebase/firebase_function.dart';
import 'package:todo/model/task_model.dart';

class UpdateTask extends StatelessWidget {
static const String routName = 'update task';
var titleController=TextEditingController();
var descriptionController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    var task=ModalRoute.of(context)!.settings.arguments as TaskModel;
    titleController.text=task.title;
    descriptionController.text=task.description;
    return Scaffold(
      appBar: AppBar(

          title:Text('TaskEdit')
      ),
      body: Column(
        children: [
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(
              label: Text('Task description'),
            ),
          ),
          TextFormField(
            controller:descriptionController ,
            decoration: InputDecoration(
              label: Text('Task Title'),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(onPressed: (){
            task.title=titleController.text;
            task.description=descriptionController.text;
            FirebaseFunction.updateTask(task.id,task );
            Navigator.pop(context);
          }, child: Text('Edit'))
        ],
      ),
    );
  }
}
