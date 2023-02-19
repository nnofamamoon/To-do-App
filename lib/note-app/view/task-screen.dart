
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/note-app/service/task-service.dart';
import 'package:todoapp/note-app/view/add-task-screen.dart';
class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(onPressed: (){
        showModalBottomSheet(
          isScrollControlled: true,
          context: context, builder: (context)=>SingleChildScrollView
          (child: Container(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: AddTaskScreen())));
      },backgroundColor: Colors.indigo[400],
      child: Icon(Icons.add),
      ),
      backgroundColor: Colors.teal,
      body: Container(
        padding: EdgeInsets.only(top: 60,left: 20,right: 20,bottom: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.playlist_add_check,size: 40,color: Colors.white,),
                SizedBox(width: 20,),
                Text('ToDo List',style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),)
              ],
            ),
            Consumer<TaskProvider>(builder:(context,number,child){
              return  Text('${number.taskList.length} tasks',style: TextStyle(color: Colors.white,fontSize: 18),);
            } ,),
           
            SizedBox(height: 20,),
            Expanded(
              child: Container(
              
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Consumer<TaskProvider>(
                  builder: (context,task,child){
                    return  ListView.builder(
                    itemCount:task.taskList.length ,
                    itemBuilder: (context,i){
                      return ListTile(
                        title: Text('${task.taskList[i].name}',style: TextStyle(decoration:task.taskList[i].isdone==true? TextDecoration.lineThrough:null),),
                        trailing: Checkbox(
                      activeColor: Colors.teal,
                      value: task.taskList[i].isdone, 
                      onChanged: (val){
                task.changeIsChecked(val!,i);
                      }),
                      onLongPress: (){
                        task.removeTask(task.taskList[i]);
                      },
                      );
                    }
                    );
                  },
               
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TaskCheckBox extends StatefulWidget {
  const TaskCheckBox({
    super.key,
  });

  @override
  State<TaskCheckBox> createState() => _TaskCheckBoxState();
}

class _TaskCheckBoxState extends State<TaskCheckBox> {
  bool isChecked=false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.teal,
      value: isChecked, 
      onChanged: (val){
setState(() {
  isChecked=val!;
});
      });
  }
}