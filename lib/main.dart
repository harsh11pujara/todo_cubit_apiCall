import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_apicall_cubit/cubit/todo_cubit.dart';
import 'package:todo_apicall_cubit/todo_home.dart';
import 'package:todo_apicall_cubit/todo_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(Repository()),
      child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: TodoHome()),
    );
  }
}
