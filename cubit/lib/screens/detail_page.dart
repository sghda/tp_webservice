import 'package:flutter/material.dart';
import 'package:tp3/models/news.dart';

class DetailPage extends StatelessWidget {
  final News news;

  const DetailPage({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('news Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(news.title),
            SizedBox(height: 10),
            Text(
              'ID:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(news.id.toString()),
            SizedBox(height: 10),
            Text(
              'Completed:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(news.completed ? 'Yes' : 'No'),
            SizedBox(height: 10),
            Text(
              'Abstract:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(news.abstract),
            SizedBox(height: 10),
            Text(
              'Content:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(news.content),
          ],
        ),
      ),
    );
  }
}
