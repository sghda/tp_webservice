// lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp3/cubit/news_cubit.dart';
import 'package:tp3/repo/news_repository.dart';
import 'package:tp3/screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => NewsCubit(NewsRepository()),
        child: HomePage(),
      ),
    );
  }
}
