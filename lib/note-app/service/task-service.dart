
import 'package:flutter/material.dart';
import 'package:todoapp/note-app/model/task-model.dart';

class TaskProvider extends ChangeNotifier{
  bool ischecked=false;
List<Task> taskList=[
  Task(name: 'go shopping',isdone: false),
    Task(name: 'study',isdone: false),
      Task(name: 'party',isdone: false),
        Task(name: 'go shopping',isdone: false),
];
changeIsChecked(bool val,int index){
  print(val);
  ischecked=val;
  taskList[index].isdone=val;
  notifyListeners();
}
addTask(Task task,BuildContext context){
  taskList.add(task);
  Navigator.of(context).pop();
    notifyListeners();
}
removeTask(Task task){
  taskList.remove(task);
   notifyListeners();
}
}