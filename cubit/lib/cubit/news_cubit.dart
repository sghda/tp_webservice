// lib/cubit/todo_cubit.dart

import 'package:bloc/bloc.dart';
import 'package:tp3/models/news.dart';
import 'package:tp3/repo/news_repository.dart';

// class NewsCubit extends News<List<News>> {
  class NewsCubit extends Cubit<List<News>> {
  final NewsRepository newsRepository;

  NewsCubit(this.newsRepository) : super([]);

  Future<void> fetchTodos() async {
    try {
      final todos = await newsRepository.getAllNews();
      emit(todos);
    } catch (error) {
      // Handle error
    }
  }
}
