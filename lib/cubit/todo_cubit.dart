import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_apicall_cubit/cubit/todo_state.dart';
import 'package:todo_apicall_cubit/todo_repository.dart';

class TodoCubit extends Cubit<TodoState>{
  final Repository _repository;
  TodoCubit(this._repository) : super(InitTodoState());

  fetchData() async{
    try{
      emit(LoadingTodoState());
      var result  = await _repository.getTodos();
      emit(ResponseTodoState(result));
    }catch(e){
      emit(ErrorTodoState(e.toString()));
    }
  }
}