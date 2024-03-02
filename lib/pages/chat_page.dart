import 'dart:io';

import 'package:chat_app/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {

  final _textController = TextEditingController();
  final _focusNode = FocusNode();

  final List<ChatMessage> _messages = [
  ];

  void _handleSubmit(String text) {
    if (text.isEmpty) return;
    
    final newMessage = ChatMessage(
      texto: text,
      uid: '123',
      animationController: AnimationController(vsync: this, duration: const Duration(milliseconds: 200)),
    );
    _messages.insert(0, newMessage);

    newMessage.animationController.forward();

    _textController.clear();
    _focusNode.requestFocus();
    setState(() {});
  }

  @override
  void dispose() {
    
    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blueAccent,
              maxRadius: 14,
              child: Text('Te', style: TextStyle(fontSize: 12),),
            ),
            SizedBox(height: 3,),
            Text('Test 1', style: TextStyle(color: Colors.black87, fontSize: 12),),
          ],
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _messages.length,
                itemBuilder: (context, index) => _messages[index],
                reverse: true,
              ),
            ),

            const Divider(height: 1,),

            Container(
              color: Colors.white,
              child: InputChat(
                textController: _textController,
                focusNode: _focusNode,
                onSubmitted: _handleSubmit,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InputChat extends StatefulWidget {

  final TextEditingController textController;
  final FocusNode focusNode;
  final Function(String) onSubmitted;

  const InputChat({
    super.key,
    required this.textController,
    required this.focusNode,
    required this.onSubmitted
  });

  @override
  State<InputChat> createState() => _InputChatState();
}

class _InputChatState extends State<InputChat> {
  bool isTyping = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: widget.textController,
                onSubmitted: (value) {
                  widget.onSubmitted(value);

                  setState(() {
                    isTyping = false;
                  });
                },
                onChanged: (value) {
                  if (value.trim().isNotEmpty) {
                    isTyping = true;
                  } else {
                    isTyping = false;
                  }
                  setState(() {});
                },
                decoration: const InputDecoration.collapsed(
                  hintText: 'Enviar mensaje'
                ),
                focusNode: widget.focusNode,
              )
            ),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Platform.isIOS
                ? CupertinoButton(
                  onPressed: isTyping
                    ? () {
                      widget.onSubmitted(widget.textController.text.trim());

                      setState(() {
                        isTyping = false;
                      });
                    }
                    : null,
                  child: const Text('Enviar'),
                )
                : Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  child: IconTheme(
                    data: IconThemeData(color: Colors.blue[400]),
                    child: IconButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      icon: Icon(Icons.send, color: isTyping ? Colors.blue[400] : Colors.grey,),
                      onPressed: isTyping
                      ? () {
                        widget.onSubmitted(widget.textController.text.trim());

                        setState(() {
                          isTyping = false;
                        });
                      }
                      : null,
                    ),
                  ),
                )
            )
          ],
        ),
      )
    );
  }
}
