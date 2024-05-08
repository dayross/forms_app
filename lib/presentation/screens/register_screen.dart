import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario'),
      ),
      body: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30,),

              FlutterLogo(size: 70,),

              SizedBox(height: 30,),

              _RegisterForm(),

              SizedBox(height: 20,),
              Text('Hola')
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(decoration: 
                InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)),
                    hintText: "Ingresa tu usuario"
                ),
              ),
        ],
      ),
    );
  }
}