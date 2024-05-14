import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp3/provider/todo_provider.dart';
import 'package:tp3/services/todo_service.dart';
import 'package:tp3/screens/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<TodoProvider>(context, listen: false).getAllTodos();
    });
    // Provider.of<TodoProvider>(context, listen: false).getAllTodos();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider API'),
      ),
      body: Consumer<TodoProvider>(
        builder: (context, todoProvider, child) {
          if (todoProvider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final todos = todoProvider.todos;
          return ListView.builder(
            itemCount: todoProvider.todos.length,
            itemBuilder: (context, index) {
              final todo = todoProvider.todos[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: todo.completed ? Color.fromARGB(255, 27, 126, 255) : Color.fromARGB(255, 0, 42, 255),
                  child: Text(todo.id.toString()),
                ),
                title: Text(
                  todo.title,
                  style: TextStyle(
                    color: todo.completed ? Colors.grey : Colors.black,
                  ),
                ),
                subtitle: Text(todo.abstract),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(todo: todo)));
                
                }
              );
            },
          );
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:tp3/provider/todo_provider.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
//       Provider.of<TodoProvider>(context, listen: false).getAllTodos();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Provider API'),
//       ),
//       body: Consumer<TodoProvider>(
//         builder: (context, todoProvider, child) {
//           if (todoProvider.isLoading) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           final todos = todoProvider.todos;
//           return ListView.builder(
//             itemCount: todos.length,
//             itemBuilder: (context, index) {
//               final todo = todos[index];
//               return ListTile(
//                 leading: CircleAvatar(
//                   backgroundColor: todo.completed ? Color.fromARGB(255, 27, 126, 255) : Color.fromARGB(255, 0, 42, 255),
//                   child: Text(todo.id.toString()),
//                 ),
//                 title: Text(
//                   todo.title,
//                   style: TextStyle(
//                     color: todo.completed ? Colors.grey : Colors.black,
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
