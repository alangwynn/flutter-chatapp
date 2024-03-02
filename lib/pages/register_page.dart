import 'package:chat_app/widgets/btn_azul.dart';
import 'package:chat_app/widgets/custom_input.dart';
import 'package:chat_app/widgets/labels.dart';
import 'package:chat_app/widgets/logo.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Logo(titulo: 'Registro',),
                  
                FormLoginPage(),
                  
                Labels(ruta: 'login', descripcion: 'Ingresa ahora', titulo: 'Ya tienes cuenta?',),
                  
                Text('Terminos y condiciones de uso', style: TextStyle(fontWeight: FontWeight.w200),),
              ],
            ),
          ),
        ),
      )
    );
  }
}



class FormLoginPage extends StatefulWidget {
  const FormLoginPage({super.key});

  @override
  State<FormLoginPage> createState() => _FormLoginPageState();
}

class _FormLoginPageState extends State<FormLoginPage> {

  final nombreCtrl = TextEditingController();
  final email = TextEditingController();
  final passCtrl = TextEditingController();

  void login() {
    print(email.text);
    print(passCtrl.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [

          CustomInput(
            icon: Icons.perm_identity,
            placeHolder: 'Nombre',
            keyboardType: TextInputType.emailAddress,
            textController: nombreCtrl,
          ),

          CustomInput(
            icon: Icons.mail_outline,
            placeHolder: 'Correo',
            keyboardType: TextInputType.emailAddress,
            textController: email,
          ),

          CustomInput(
            icon: Icons.lock_outline,
            placeHolder: 'Correo',
            keyboardType: TextInputType.text,
            textController: passCtrl,
            isPassword: true,
          ),

          BotonAzul(
            onPressed: login,
            text: 'Ingresar',
          ),
          
        ],
      ),
    );
  }
}
