import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todo_apicall_cubit/todo_model.dart';

class Repository {

  Future<List<TodoModel>> getTodos() async {
    String url = 'https://jsonplaceholder.typicode.com/todos';
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      final decodeJSON = jsonDecode(response.body) as List;
      final mapValue = decodeJSON.map((e) {
        return TodoModel(
            id: e['id'],
            userId: e['userId'],
            title: e['title'],
            completed: e['completed']);
      }).toList();
      return mapValue;
    } else {
      throw "Something went wrong code ${response.statusCode}";
    }
  }
}
