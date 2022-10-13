import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String message;

  ChatMessage({Key? key, required this.message}) : super(key: key);

  List<ChatMessage> _chats = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            child: Text(''),
            backgroundColor: Colors.blueAccent,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(
                    8.0,
                  ),
                  child: Text(
                    'ID',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  child: Text(
                    message,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
