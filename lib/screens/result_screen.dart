import 'package:flutter/material.dart';

class ResultsPage extends StatefulWidget {
  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  final List<Result> results = [
    Result(title: 'Exam 1', score: 95),
    Result(title: 'Exam 2', score: 85),
    Result(title: 'Assignment 1', score: 100),
    Result(title: 'Quiz 1', score: 90),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results Page'),
      ),
      body: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(results[index].title),
            subtitle: Text('Score: ${results[index].score}'),
          );
        },
      ),
    );
  }
}

class Result {
  final String title;
  final int score;

  Result({
    required this.title,
    required this.score,
  });
}
