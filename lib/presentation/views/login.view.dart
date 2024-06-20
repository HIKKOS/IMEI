import 'package:flutter/material.dart';
import 'package:imei/config/routes/app_routes.dart';
import 'package:imei/config/themes/app_colors.dart';
import 'package:imei/utils/navigation_util.dart';
import 'package:imei/utils/preferences.dart';
import 'package:imei/presentation/widgets/correo_input.dart';
import 'package:imei/presentation/widgets/password_input.dart';

Map<String, dynamic> _formData = {
  'correo': '',
  'password': '',
};

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
bool switchValue = true;

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.25,
          color: LightColors.primary,
          child: const SafeArea(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 20,
                  child: Text('Bienvenido',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 36)),
                ),
                Positioned(
                  right: -50,
                  child: Icon(
                    Icons.person,
                    size: 100,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
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
                            child: CorreoInput(onChanged: (String? value) {
                              if (value != null) _formData['correo'] = value;
                            }),
                          ),
                          PasswordInput(
                            onChanged: (String? value) {
                              if (value != null) _formData['password'] = value;
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                const SizedBox(
                                  width: double.infinity,
                                  child: Text('¿Olvidaste tu contraseña?',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: LightColors.primary)),
                                ),
                                //TODO:! cambiar ruta
                                GestureDetector(
                                  onTap: () => Navigation.pushNamed(
                                      routeName: AppRoutes.home),
                                  child: Container(
                                    color: Colors.transparent,
                                    width: double.infinity,
                                    height: 50,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                              padding: EdgeInsets.only(bottom: 12.0),
                              child: _LoginButton()),
                          const _SesionActivaSwitch(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      const Text('Si no tienes una cuenta puedes ',
                          style: TextStyle(
                              fontSize: 16, color: LightColors.primary)),
                      TextButton(
                          style: ButtonStyle(
                              padding: WidgetStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.all(0)),
                              overlayColor: WidgetStateProperty.all<Color>(
                                  Colors.transparent)),
                          onPressed: () {
                            Navigation.pushNamed(routeName: AppRoutes.signIn);
                          },
                          child: const Text('Crear una',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: LightColors.primary)))
                    ])),
              ),
            ],
          ),
        )

        /*  Stack(
              children: [
                const SafeArea(
                    child: Padding(
                  padding: EdgeInsets.only(bottom: 12.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Si no tienes una cuenta puedes ',
                            style: TextStyle(
                                fontSize: 16, color: LightColors.primary)),
                        Text('crear una',
                            style: TextStyle(
                                fontSize: 16, color: LightColors.primary)),
                      ]),
                )),
                GestureDetector(
                  onTap: () =>
                      Navigation.pushNamed(routeName: AppRoutes.signIn),
                  child: Container(
                    color: Colors.transparent,
                    height: 60,
                    width: 100,
                  ),
                ),
              ],
            ), */
      ],
    ));
  }
}

class _SesionActivaSwitch extends StatefulWidget {
  const _SesionActivaSwitch();

  @override
  State<_SesionActivaSwitch> createState() => _SesionActivaSwitchState();
}

class _SesionActivaSwitchState extends State<_SesionActivaSwitch> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(
          'Mantener sesión iniciada',
          style: TextStyle(color: LightColors.primary, fontSize: 18),
        ),
        Switch.adaptive(
          value: switchValue,
          onChanged: (value) {
            switchValue = value;
            setState(() {});
          },
        ),
      ],
    );
  }
}

class _LoginButton extends StatefulWidget {
  const _LoginButton();

  @override
  State<_LoginButton> createState() => __LoginButtonState();
}

class __LoginButtonState extends State<_LoginButton> {
  bool isLocked = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigation.pushNamedAndRemoveUntil(routeName: AppRoutes.home);
      },
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(isLocked ? 'Iniciando sesión' : 'Aceptar',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            if (isLocked)
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator.adaptive(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
