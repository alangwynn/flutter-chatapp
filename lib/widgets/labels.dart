import 'package:flutter/material.dart';

class Labels extends StatelessWidget {

  final String ruta;
  final String descripcion;
  final String titulo;

  const Labels({
    super.key,
    required this.ruta,
    required this.descripcion,
    required this.titulo
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(titulo, style: const TextStyle(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w300),),
          const SizedBox(height: 10,),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, ruta);
            },
            child: Text(descripcion, style: TextStyle(color: Colors.blue[600], fontSize: 18, fontWeight: FontWeight.bold),)
          ),
        ],
      ),
    );
  }
}
