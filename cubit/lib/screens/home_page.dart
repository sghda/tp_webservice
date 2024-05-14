// lib/screens/home_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp3/cubit/news_cubit.dart';
import 'package:tp3/models/news.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: BlocBuilder<NewsCubit, List<News>>(
        builder: (context, todos) {
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return ListTile(
                title: Text(todo.title),
                subtitle: Text(todo.completed ? 'Completed' : 'Not Completed'),
              );
            },
          );
        },
      ),
    );
  }
}
