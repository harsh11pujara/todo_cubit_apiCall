import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_apicall_cubit/cubit/todo_cubit.dart';
import 'package:todo_apicall_cubit/cubit/todo_state.dart';
import 'package:todo_apicall_cubit/todo_model.dart';
import 'package:todo_apicall_cubit/todo_repository.dart';

class TodoHome extends StatefulWidget {
  const TodoHome({Key? key}) : super(key: key);

  @override
  State<TodoHome> createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context.read<TodoCubit>();
      cubit.fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text('Todo Using Cubit',style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: BlocBuilder<TodoCubit , TodoState>(
        builder: (context, state) {
          if (state is InitTodoState || state is LoadingTodoState){
            return const Center(child : CircularProgressIndicator());
          }
          else if(state is ResponseTodoState){
            List<TodoModel> todoData = state.todos;
            return ListView.builder(itemCount: todoData.length,itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                child: ListTile(
                  tileColor: Colors.grey,
                  leading: CircleAvatar(backgroundColor: Colors.redAccent,child: Text(todoData[index].id.toString()),),
                  title: Text(todoData[index].title.toString(),style: TextStyle(color: Colors.black)),
                  trailing: Icon(todoData[index].completed == true? Icons.check_box : Icons.check_box_outline_blank, color: Colors.white,),
                ),
              );
            },);
          }

        return Text(state.toString());
      },),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
          onPressed: () {
            Repository().getTodos();
          },
          child: const Icon(Icons.add)),
    );
  }
}
