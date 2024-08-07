import 'package:app_gestao_de_tarefas/app/core/constants/routes.dart';
import 'package:app_gestao_de_tarefas/app/core/ui/extensions/theme_extension.dart';
import 'package:app_gestao_de_tarefas/app/core/ui/helper/loader.dart';
import 'package:app_gestao_de_tarefas/app/core/ui/widgets/custom_form_field.dart';
import 'package:app_gestao_de_tarefas/app/modules/auth/login/login_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/exceptions/auth_exception.dart';
import '../../../core/ui/helper/messages.dart';
import '../../../core/ui/widgets/logo_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with Loader {
  final _store = Modular.get<LoginStore>();
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    reaction((_) => _store.statusLoader, (status) {
      switch (status) {
        case LoaderStatus.loading:
          showLoader();
          break;
        default:
          hideLoader();
          break;
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const LogoWidget(
                  text: 'Login',
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
                          enableSwapObscure: true,
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () async {
                                  try {
                                    if (_emailEC.text.isEmpty) {
                                      _focusNode.requestFocus();
                                      Messages.of(context).showInfo('Digite um e-mail para recuperar a senha');
                                      return;
                                    }
                                    _store.showLoader();
                                    await _store.recoverPassword(email: _emailEC.text);
                                    if (context.mounted) {
                                      Messages.of(context).showSuccess('E-mail para recuperar a senha enviado.');
                                    }
                                  } on AuthException catch (e) {
                                    if (context.mounted) {
                                      Messages.of(context).showError(e.message);
                                    }
                                  } finally {
                                    _store.hideLoader();
                                  }
                                },
                                child: const Text('Esqueceu sua senha?')),
                            ElevatedButton(
                              onPressed: () async {
                                try {
                                  bool formIsValid = _formKey.currentState?.validate() ?? false;

                                  if (formIsValid) {
                                    _store.showLoader();
                                    await _store.login(email: _emailEC.text, password: _passwordEC.text);
                                  }
                                } on AuthException catch (e) {
                                  if (context.mounted) {
                                    Messages.of(context).showError(e.message);
                                  }
                                } catch (e) {
                                  if (context.mounted) {
                                    Messages.of(context).showError('Ocorreu um erro desconhecido ao tentar fazer o login');
                                  }
                                } finally {
                                  _store.hideLoader();
                                }
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
                                  'Login',
                                  style: TextStyle(color: context.onBackground),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Não tem conta?',
                      style: TextStyle(color: context.onBackground),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(Routers.register);
                      },
                      child: const Text(
                        'Registrar-se',
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
