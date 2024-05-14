import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:tp3/model/todo.dart';
import 'package:tp3/services/todo_service.dart';

class TodoProvider extends ChangeNotifier {
  final TodoService _todoService = TodoService();
  bool isLoading = false;
  List<Todo> _todos = [];
  List<Todo> get todos => _todos;
  Future<void> getAllTodos() async {
    isLoading = true;
    final response = await _todoService.getAll();
    // _todos = await _todoService.getAll();
    _todos = response;
    isLoading = false;

    notifyListeners();
  }
}

// import 'package:flutter/material.dart';
// import 'package:tp3/model/todo.dart';
// import 'package:tp3/services/todo_service.dart';

// class TodoProvider with ChangeNotifier {
//   final TodoService todoService;
//   List<Todo> _todos = [];
//   bool _isLoading = false;

//   TodoProvider({required this.todoService});

//   List<Todo> get todos => _todos;
//   bool get isLoading => _isLoading;

//   Future<void> getAllTodos() async {
//     _isLoading = true;
//     notifyListeners();
//     try {
//       _todos = await todoService.getAllTodos();
//     } catch (error) {
//       throw error;
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }
// }

