import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp3/provider/todo_provider.dart';
import 'package:tp3/screens/home_page.dart';
import 'package:tp3/services/todo_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MaterialApp(
        title: 'Todo App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
      );
  }
}

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:tp3/provider/todo_provider.dart';
// import 'package:tp3/screens/home_page.dart';
// import 'package:tp3/services/todo_service.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (_) => TodoProvider(todoService: TodoService()),
//         ),
//       ],
//       child: MaterialApp(
//         title: 'Flutter FastAPI Demo',
//         home: HomePage(),
//       ),
//     );
//   }
// }

