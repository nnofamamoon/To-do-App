import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/note-app/view/task-screen.dart';
import 'package:todoapp/note-app/service/task-service.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>TaskProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      home: TaskScreen(),
    ));
  }
}


