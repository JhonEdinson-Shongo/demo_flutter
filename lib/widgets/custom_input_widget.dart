import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInputWidget extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final String? counterText;
  final IconData? iconL;
  final IconData? iconR;
  final TextInputType? inputType;
  final bool obscureText;

  final String formProperty;
  final Map<String, String> formValues;

  const CustomInputWidget({
    Key? key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.counterText,
    this.iconL,
    this.iconR,
    this.inputType,
    this.obscureText = false,
    required this.formProperty,
    required this.formValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: TextCapitalization.words,
      onChanged: (value) => formValues[formProperty] = value,
      keyboardType: inputType,
      obscureText: obscureText,
      validator: (value) {
        if (value == null) return 'Este campo es requerido';
        return value.length < 3 ? 'Minimo 3 caracteres' : null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        counterText: counterText,
        suffixIcon: iconR == null ? null : Icon(iconR),
        icon: iconL == null ? null : Icon(iconL),
      ),
    );
  }
}
