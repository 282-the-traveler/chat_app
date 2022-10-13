import 'package:chat_app/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _textEditingController = TextEditingController();

  List<ChatMessage> _chats = [];

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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return _chats[index];
              },
              reverse: true,
              itemCount: _chats.length,
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        hintText: 'Message',
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
        ],
      ),
    );
  }

  void _handleSubmitted(String text) {
    Logger().d(text);
    if (text.isNotEmpty) {
      _textEditingController.clear();
      setState(() {
        ChatMessage newChat = ChatMessage(message: text,);
        _chats.insert(0, newChat);
      });
    }
  }
}
