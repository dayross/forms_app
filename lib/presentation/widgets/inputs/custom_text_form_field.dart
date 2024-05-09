import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final String? errorMessage;
  final bool obscure;
  Function(String)? onChanged;
  String? Function(String?)? validator;

  CustomTextFormField(
      {super.key,
      this.hint = '',
      this.errorMessage,
      this.obscure = false,
      this.onChanged,
      this.validator});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(borderRadius: BorderRadius.circular(10));

    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscure,
      decoration: InputDecoration(
          hintText: hint,
          
          enabledBorder: border,

          focusedBorder:
              border.copyWith(borderSide: BorderSide(color: colors.primary)),
          
          errorBorder: border.copyWith(
              borderSide: BorderSide(color: Colors.red.shade800)),
          
          focusedErrorBorder: border.copyWith(
              borderSide: BorderSide(color: Colors.red.shade800)),
          
          isDense: true,
          label: Text(hint),
          errorText: errorMessage),
    );
  }
}
