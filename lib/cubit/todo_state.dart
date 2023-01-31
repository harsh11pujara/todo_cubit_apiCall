import 'package:todo_apicall_cubit/todo_model.dart';

abstract class TodoState{}

class InitTodoState extends TodoState{}

class LoadingTodoState extends TodoState{}

class ErrorTodoState extends TodoState{
  String msg;
  ErrorTodoState(this.msg);
}

class ResponseTodoState extends TodoState{
  final List<TodoModel> todos;
  ResponseTodoState(this.todos);
}