import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import '../widgets/inputs/custom_text_form_field.dart';

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

class _RegisterView extends StatefulWidget {
  const _RegisterView();

  @override
  State<_RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<_RegisterView> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String user = '';
  String email = '';
  String passwd = '';

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Form(
            key: _formKey,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20,),
            
                const FlutterLogo(size: 70,),
                
                const SizedBox(height: 30,),
                
                const Text('Registrate. Es gratis.',
                  style: TextStyle(fontSize: 28),
                ),
                
                const SizedBox(height: 30,),
                
                CustomTextFormField(
                  hint: 'Nombre',
                  // errorMessage: 'Ingrese un nombre valido.',
                  onChanged:(value) => user = value,
                  validator: (value) {
                    if(value == null || value.isEmpty || value.trim().isEmpty) return 'Campo requerido'; 
                    return null;
                  },
                ),
                
                const SizedBox(height: 20,),
            
                CustomTextFormField(
                  hint: 'Correo',
                  // errorMessage: 'Ingrese un correo valido.',
                  onChanged:(value) => email = value,
                  validator: (value) {
                    if(value == null || value.isEmpty || value.trim().isEmpty) return 'Campo requerido'; 
                    final emailRegExp = RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      );

                    if(!emailRegExp.hasMatch(value)) return 'Ingrese un correo valido.';
                  },
                ),
            
                const SizedBox(height: 20,),
            
                CustomTextFormField(
                  hint: 'Contraseña',
                  // errorMessage: 'La contraseña debe de contener 6 caracteres como minimo.',
                  obscure: true,
                  onChanged:(value) => passwd = value,
                  validator: (value) {
                    if(value == null || value.isEmpty || value.trim().isEmpty) return 'Campo requerido'; 
                    if(value.trim().length < 6 ) return 'Su contraseña debe contener 6 caracteres como minimo'; 
                  },
                ),
                const SizedBox(height: 20,),
            
                FilledButton.icon(
                  onPressed: () {
                    final isValid = _formKey.currentState!.validate();
                    if(!isValid) return;
                    print('$user, $email, $passwd' );
                  },
                  icon: const Icon(Icons.done),
                  label: const Text('Guardar'),
            
                  
                )
              ],
            ),
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
          TextFormField(
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                hintText: "Ingresa tu usuario"),
          ),
        ],
      ),
    );
  }
}
