import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {

  final Function()? onPressed; 
  final String text;

  const BotonAzul({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5,
          backgroundColor: Colors.blue,
          shape: const StadiumBorder(),
        ),
        onPressed: onPressed,
        child: SizedBox(
          width: double.infinity,
          height: 55,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 17),
            ),
          ),
        ));
  }
}
