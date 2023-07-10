import 'package:flutter/material.dart';
import 'package:todo/firebase/firebase_function.dart';
import 'package:todo/model/task_model.dart';

class ShowAddTaskBottomSheet extends StatefulWidget {

  @override
  State<ShowAddTaskBottomSheet> createState() => _ShowAddTaskBottomSheetState();
}

class _ShowAddTaskBottomSheetState extends State<ShowAddTaskBottomSheet> {
  var formKey = GlobalKey<FormState>();
  var tasksTitleCdntroller = TextEditingController();
  var tasksDescriptionCdntroller = TextEditingController();
  DateTime selectedDate = DateUtils.dateOnly(DateTime.now());


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                textAlign: TextAlign.center,
                'Add New Task',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: tasksTitleCdntroller,
                validator: (value) {
                  if(value==null||value.isEmpty){
                    return 'please enter task title';
                  }
                    return null ;

                },
                decoration: InputDecoration(
                  label: Text('Task title'),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: tasksDescriptionCdntroller,
                validator: (value) {
                  if(value==null||value.isEmpty){
                    return 'please enter task Description';
                  }
                    return null ;

                },
                decoration: InputDecoration(
                  label: Text('TaskDescription'),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  textAlign: TextAlign.start,
                  'Select Time',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: (){
                  chooseTaskDate(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    selectedDate.toString().substring(0,10),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    if(formKey.currentState!.validate()){
                      TaskModel task=TaskModel(title:tasksTitleCdntroller.text ,
                          date: selectedDate.millisecondsSinceEpoch,
                          description: tasksDescriptionCdntroller.text,
                          status: false);

                      FirebaseFunction.addTaskToFirestore(task).then((value) {
                        Navigator.of(context);
                      });
                    }
                  },
                  child: Text(

                    'Add Task',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                        ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void chooseTaskDate(BuildContext context)async {
    DateTime ? chosenDate = await showDatePicker(context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)),

    );
    if(chosenDate!=null){
      selectedDate=DateUtils.dateOnly(chosenDate);
      setState(() {

      });
    }
  }
}
