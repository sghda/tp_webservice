import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp3/provider/todo_provider.dart';
import 'package:tp3/services/todo_service.dart';
import 'package:tp3/screens/detail_page.dart';
// import 'package:flutter_html/flutter_html.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchText = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<TodoProvider>(context, listen: false).getAllTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider API'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                print("Tap notification");
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Daily News',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'YourUniqueFont',
                    // Example unique font: 'Pacifico'
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            hintText: 'Search',
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {
                            setState(() {
                              searchText = value;
                            });
                          },
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          // Perform search action
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'For You',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Consumer<TodoProvider>(
                builder: (context, todoProvider, child) {
                  if (todoProvider.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final todos = todoProvider.todos.where((todo) => todo.title.toLowerCase().contains(searchText.toLowerCase())).toList();
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      final todo = todos[index];
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                        ),
                        child: ListTile(
                          leading: 
                            Icon(
                              Icons.newspaper,
                              color: todo.completed ? Colors.grey : Colors.black,
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
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
