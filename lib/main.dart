import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/Home.dart';
import 'package:todo_application/todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: ChangeNotifierProvider(
        create: (context) => Todo(),
        child: Home(),
      ),
    );
  }
}
