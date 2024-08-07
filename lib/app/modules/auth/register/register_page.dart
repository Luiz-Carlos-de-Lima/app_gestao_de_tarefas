import 'package:app_gestao_de_tarefas/app/core/ui/theme_extension.dart';
import 'package:app_gestao_de_tarefas/app/core/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/constants/routes.dart';
import '../../../core/widgets/todo_list_logo.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _confirmPasswordEC = TextEditingController();
  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Modular.to.pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
          backgroundColor: context.background,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const LogoWidget(
                  text: 'Registrar-se',
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomFormField(
                          labelText: 'E-mail',
                          controller: _emailEC,
                          focusNode: _focusNode,
                          validator: Validatorless.multiple([
                            Validatorless.required('O E-mail é obrigatório'),
                            Validatorless.email('insira um E-mail válido'),
                          ]),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        CustomFormField(
                          labelText: 'Senha',
                          controller: _passwordEC,
                          validator: Validatorless.multiple([
                            Validatorless.required('A senha é obrigatória'),
                            Validatorless.min(6, 'A senha deve ter no minímo 6 caracteres'),
                          ]),
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        CustomFormField(
                          labelText: 'Confirmar Senha',
                          controller: _confirmPasswordEC,
                          validator: Validatorless.multiple([
                            Validatorless.required('Confirmar Senha é obrigatória'),
                            Validatorless.compare(_passwordEC, 'Confirmar senha deve ser igual a senha'),
                          ]),
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              // bool formIsValid = _formKey.currentState?.validate() ?? false;

                              // if (formIsValid) {
                              //   await context.read<LoginController>().login(email: _emailEC.text, password: _passwordEC.text);
                              // }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: context.buttonColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Registrar',
                                style: TextStyle(color: context.onBackground),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Já tem conta?',
                      style: TextStyle(color: context.onBackground),
                    ),
                    TextButton(
                      onPressed: () {
                        Modular.to.pop();
                      },
                      child: const Text(
                        'Login',
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
