import 'package:imei/config/themes/app_colors.dart';
import 'package:flutter/material.dart';

class CorreoInput extends StatelessWidget {
  final String? label;
  final String? initialValue;
  final Function(String?) onChanged;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final bool withoutValidation;

  const CorreoInput({
    super.key,
    required this.onChanged,
    this.controller,
    this.focusNode,
    this.initialValue,
    this.validator,
    this.label,
  }) : withoutValidation = false;

  const CorreoInput.withoutValidation({
    super.key,
    required this.onChanged,
    this.controller,
    this.focusNode,
    this.initialValue,
    this.label,
  })  : validator = null,
        withoutValidation = true;

  @override
  Widget build(BuildContext context) {
    String? validationFunction(String? value) {
      final RegExp regExp = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
      final bool isEmpty = value == null || value.isEmpty;
      if (isEmpty) return 'Por favor ingrese algo';
      final bool emailValid = regExp.hasMatch(value);
      if (!emailValid) return 'Por favor ingrese un correo válido';
      return null;
    }

    var validator = (withoutValidation) ? null : validationFunction;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label ?? 'Correo electrónico',
            style: const TextStyle(
              color: LightColors.text,
              fontSize: 18,
            )),
        const SizedBox(height: 10),
        TextFormField(
            initialValue: initialValue,
            style: const TextStyle(color: LightColors.text),
            controller: controller,
            cursorColor: Theme.of(context).primaryColor,
            autofocus: false,
            keyboardType: TextInputType.emailAddress,
            onChanged: onChanged,
            validator: validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              hintText: 'correo@mail.com',
              prefixIcon: Icon(Icons.email_rounded),
            )),
      ],
    );
  }
}
