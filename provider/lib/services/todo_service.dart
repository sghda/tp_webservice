import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tp3/model/todo.dart';

class TodoService {
  Future<List<Todo>> getAll() async {
    // const url = 'https://jsonplaceholder.typicode.com/todos';
    const url = 'http://127.0.0.1:8000/todos/?skip=0&limit=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List ;
      final todos = json.map((e) {
        return Todo(
          id: e['id'], 
          userId: e['userId'], 
          title: e['title'], 
          completed: e['completed'],
          abstract: e['abstract'],
          content: e['content'],
          );
      }).toList();
      return todos;
    }
    return [];
    // throw Exception('Failed to load todos');
  }
}

// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:tp3/model/todo.dart';
// class TodoService {
//   final String baseUrl = 'http://127.0.0.1:8000'; // Ganti dengan URL backend Anda

//   Future<List<Todo>> getAllTodos() async {
//     final response = await http.get(Uri.parse('$baseUrl/todos/?skip=0&limit=10'));
//     if (response.statusCode == 200) {
//       List<dynamic> body = json.decode(response.body);
//       return body.map((dynamic item) => Todo.fromJson(item)).toList();
//     } else {
//       throw Exception('Failed to load todos');
//     }
//   }
// }
