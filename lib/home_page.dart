import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chat App',
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    hintText: 'Send a message',
                  ),
                  onSubmitted: (String text) {
                    _handleSubmitted(text);
                  },
                ),
              ),
              SizedBox(
                width: 8.0,
              ),
              ElevatedButton(
                onPressed: () {
                  _handleSubmitted(
                    _textEditingController.text,
                  );
                },
                child: Text(
                  'Send',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleSubmitted(String text) {
    Logger().d(text);
    _textEditingController.clear();
  }
}
