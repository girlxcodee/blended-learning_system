import 'package:flutter/material.dart';

class DiscussionBoard extends StatefulWidget {
  @override
  _DiscussionBoardState createState() => _DiscussionBoardState();
}

class _DiscussionBoardState extends State<DiscussionBoard> {
  final List<Thread> threads = [    Thread(title: 'Welcome to the Discussion Board!', body: 'This is the body of the first thread'),    Thread(title: 'Second thread', body: 'This is the body of the second thread'),    Thread(title: 'Third thread', body: 'This is the body of the third thread'),  ];

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discussion Board'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: threads.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(threads[index].title),
                  subtitle: Text(threads[index].body),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Enter thread title',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _bodyController,
              decoration: InputDecoration(
                hintText: 'Enter thread body',
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              setState(() {
                threads.add(Thread(title: _titleController.text, body: _bodyController.text));
              });
            },
            child: Text('Create Thread'),
          ),
        ],
      ),
    );
  }
}

class Thread {
  final String title;
  final String body;

  Thread({
    required this.title,
    required this.body,
  });
}
