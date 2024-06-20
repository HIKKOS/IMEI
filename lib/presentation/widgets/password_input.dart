import 'package:imei/config/themes/app_colors.dart';
import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final String? initialValue;
  final String? label;
  final Function(String?) onChanged;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  const PasswordInput({
    super.key,
    required this.onChanged,
    this.controller,
    this.focusNode,
    this.initialValue,
    this.label,
  });

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label ?? 'Contraseña',
            style: const TextStyle(
              color: LightColors.text,
              fontSize: 18,
            )),
        const SizedBox(height: 10),
        TextFormField(
            controller: widget.controller,
            cursorColor: Theme.of(context).primaryColor,
            autofocus: false,
            keyboardType: TextInputType.text,
            obscureText: isObscure,
            onChanged: widget.onChanged,
            validator: (value) =>
                value!.length < 6 ? 'minimo 6 caracteres' : null,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              hintText: '●●●●●●●●',
              prefixIcon: const Icon(Icons.lock_rounded),
              suffixIcon: IconButton(
                  onPressed: () {
                    isObscure = !isObscure;
                    setState(() {});
                  },
                  icon: Icon(
                    isObscure
                        ? Icons.visibility_rounded
                        : Icons.visibility_off_rounded,
                    size: 30,
                  )),
            ))
      ],
    );
  }
}
