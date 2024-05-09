import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:forms_app/infrastructure/inputs/inputs.dart';
import 'package:forms_app/presentation/blocs/register/register_cubit.dart';
import '../widgets/inputs/custom_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario'),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),)
    );
  }
}

class _RegisterView extends StatefulWidget {
  const _RegisterView();

  @override
  State<_RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<_RegisterView> {

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final registerCubit = context.watch<RegisterCubit>();
    
    final username = registerCubit.state.user;
    final password = registerCubit.state.passwd;
    final email = registerCubit.state.email;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Form(
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
                  onChanged:(value) => registerCubit.userChanged(value),
                  errorMessage: username.errorMessage,
                ),
                
                const SizedBox(height: 20,),
            
                CustomTextFormField(
                  hint: 'Correo',
                  // errorMessage: 'Ingrese un correo valido.',
                  onChanged:(value) => registerCubit.emailChanged(value),
                  errorMessage: email.errorMessage,
                ),
            
                const SizedBox(height: 20,),
            
                CustomTextFormField(
                  hint: 'Contraseña',
                  // errorMessage: 'La contraseña debe de contener 6 caracteres como minimo.',
                  obscure: true,
                  onChanged:(value) => registerCubit.passwdChanged(value),
                  errorMessage: password.errorMessage,
                ),
                const SizedBox(height: 20,),
            
                FilledButton.icon(
                  onPressed: () {
                    // final isValid = _formKey.currentState!.validate();
                    // if(!isValid) return;
                    registerCubit.onSubmit();
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
