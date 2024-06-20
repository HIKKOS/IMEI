import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:imei/config/themes/themes.dart';
import 'package:imei/presentation/widgets/correo_input.dart';
import 'package:imei/presentation/widgets/telefono_input.dart';

import 'package:imei/presentation/widgets/usuario_input.dart';
import 'package:imei/utils/navigation_util.dart';

import '../widgets/password_input.dart';

Map<String, dynamic> _formData = {
  'nombre': '',
  'celular': '',
  'email': '',
  'password': '',
};
GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class RegistroView extends StatelessWidget {
  const RegistroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.25,
          color: LightColors.primary,
          child: SafeArea(
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Positioned(
                  right: -50,
                  child: Icon(
                    Icons.person,
                    size: 100,
                    color: Colors.white,
                  ),
                ),
                const Positioned(
                  left: 20,
                  child: Text('Registro',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 36)),
                ),
                const Positioned(
                  bottom: 10,
                  left: 20,
                  child: Text('Rellena los campos',
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
                Positioned(
                    left: 0,
                    top: 0,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        size: 40,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigation.pop(),
                    )),
              ],
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.75,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 12,
                    right: 20,
                    left: 20.0,
                  ),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: UsuarioInput(onChanged: (String? value) {
                              if (value != null) _formData['nombre'] = value;
                            }),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: TelefonoInput(onChanged: (String? value) {
                              if (value != null) _formData['celular'] = value;
                            }),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: CorreoInput(onChanged: (String? value) {
                              if (value != null) _formData['email'] = value;
                            }),
                          ),
                          PasswordInput(
                            onChanged: (String? value) {
                              if (value != null) _formData['password'] = value;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 12.0, right: 20, left: 20),
                child: _RegistroButton(),
              ),
            ],
          ),
        ),
      ]),
    ));
  }
}

class _RegistroButton extends StatelessWidget {
  const _RegistroButton();
  @override
  Widget build(BuildContext context) => SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              print(_formData);
            }
          },
          child: Center(
            child: Text('Registrarse',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
        ),
      );
}
