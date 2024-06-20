import 'package:imei/config/themes/app_colors.dart';
import 'package:flutter/material.dart';

class UsuarioInput extends StatelessWidget {
  final String? label;
  final String? initialValue;
  final Function(String?) onChanged;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final bool withoutValidation;

  const UsuarioInput({
    super.key,
    required this.onChanged,
    this.controller,
    this.focusNode,
    this.initialValue,
    this.validator,
    this.label,
  }) : withoutValidation = false;

  const UsuarioInput.withoutValidation({
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
      final bool isEmpty = value == null || value.isEmpty;
      if (isEmpty) return 'Por favor ingrese algo';
      return null;
    }

    var validator = (withoutValidation) ? null : validationFunction;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label ?? 'Nombre de usuario',
            style: const TextStyle(
              color: LightColors.primary,
              fontSize: 18,
            )),
        const SizedBox(height: 10),
        TextFormField(
            style: const TextStyle(color: LightColors.text),
            controller: controller,
            cursorColor: LightColors.primary,
            autofocus: false,
            keyboardType: TextInputType.emailAddress,
            onChanged: onChanged,
            validator: validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              hintText: 'Nombre de usuario',
              prefixIcon: Icon(Icons.person_rounded),
            )),
      ],
    );
  }
}
