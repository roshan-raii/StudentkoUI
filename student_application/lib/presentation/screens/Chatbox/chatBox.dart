import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<String> _messages = [];
  final TextEditingController _textEditingController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              reverse: true, // Scroll to bottom initially
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Align(
                    alignment:
                        Alignment.centerRight, // Align messages to the right
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      child: Text(
                        _messages[index],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  onPressed: () {
                    sendMessage(_textEditingController.text);
                  },
                  icon: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void sendMessage(String message) {
    setState(() {
      _messages.insert(
          0, message); // Insert new message at the beginning of the list
      _textEditingController.clear();
      // Scroll to the bottom after sending a message
      _scrollController.animateTo(
        0.0,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    });
  }
}
