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