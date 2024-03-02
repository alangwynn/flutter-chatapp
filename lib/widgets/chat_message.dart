import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {

  final String texto;
  final String uid;
  final AnimationController animationController;

  const ChatMessage({
    super.key,
    required this.texto,
    required this.uid,
    required this.animationController,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(
          parent: animationController,
          curve: Curves.easeOut,
        ),
        child: Container(
          child: uid == '123'
            ? MyMessage(texto: texto,)
            : FriendMessage(texto: texto,),
        ),
      ),
    );
  }
}

class MyMessage extends StatelessWidget {

  final String texto;

  const MyMessage({
    super.key,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(
          right: 5,
          bottom: 5,
          left: 100
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF4D9EF6),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(texto, style: const TextStyle(color: Colors.white),),
      ),
    );
  }
}

class FriendMessage extends StatelessWidget {

  final String texto;

  const FriendMessage({
    super.key,
    required this.texto,
  });
  
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(
          right: 100,
          bottom: 5,
          left: 5,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFE4E5E8),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(texto, style: const TextStyle(color: Colors.black87),),
      ),
    );
  }
}
