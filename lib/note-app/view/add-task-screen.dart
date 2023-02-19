
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/note-app/model/task-model.dart';
import 'package:todoapp/note-app/service/task-service.dart';
class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // String? name;
    TextEditingController name=TextEditingController();
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add task',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30,color: Colors.indigo[400],fontWeight: FontWeight.bold),),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
          // onChanged: (value){
          //   name=value;
          // },
          controller: name,
          ),
          SizedBox(height: 30,),
          Consumer<TaskProvider>(
            builder:(context,task,child){
              return TextButton(onPressed: (){
                Task t=Task(name: name.text,isdone: false);
               
              task.addTask(t,context);
            }, child: Text('Add'),
            style: TextButton.styleFrom(
              backgroundColor: Colors.teal,
              primary: Colors.white
            ),
            );
            }
          
          )
        ],
      ),
    );
  }
}