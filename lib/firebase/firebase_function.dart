import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/model/task_model.dart';

class FirebaseFunction {
  static CollectionReference<TaskModel> gitTasksCollection() {
    return FirebaseFirestore.instance.collection('Tasks').withConverter<TaskModel>(
      fromFirestore: (snapshot, options) {
        return TaskModel.fromjson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.tojson();
      },
    );
  }

  static Future<void> addTaskToFirestore(TaskModel taskModel){
    var collection = gitTasksCollection();
    var docRef = collection.doc();
    taskModel.id=docRef.id;
    return docRef.set(taskModel);
  }

  static Stream<QuerySnapshot<TaskModel>> getTaskFromFirestore(DateTime date){
    var collection = gitTasksCollection();
    return collection.where("data",isEqualTo:DateUtils.dateOnly(date).millisecondsSinceEpoch).snapshots();
}
  static Future<void> deletTask(String id){
    return gitTasksCollection().doc(id).delete();
  }

static Future<void> updateTask(String id,TaskModel task){
    return gitTasksCollection().doc(id).update(task.tojson());
}
}
