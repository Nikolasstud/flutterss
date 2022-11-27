import 'package:flutter/material.dart';

import '../../../data/repositories/auth_repository_impl.dart';
import '../../../domain/usercases/auth.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/text_field_obscure.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> _key = GlobalKey();

  TextEditingController _loginController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),
                const Text(
                  'Регистрация',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Container(
                  margin:
                      const EdgeInsets.only(right: 300, bottom: 7, left: 300),
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: 28,
                    ),
                    maxLength: 30,
                    controller: _loginController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Не должно быть пустым';
                      }
                      if (value.length < 5) {
                        return 'Логин должен быть не менее 5 символов';
                      }
                      if (!RegExp("^(?=.*[a-z])")
                          .hasMatch(value)) {
                        return 'Логин должен содержать только латинские буквы';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Логин',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(right: 300, bottom: 7, left: 300),
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: 28,
                    ),
                    maxLength: 22,
                    controller: _passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Не должно быть пустым';
                      }
                      if (value.length < 8) {
                        return 'Пароль должен быть не меньше 8 символов';
                      }
                      if (!RegExp("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])")
                          .hasMatch(value)) {
                        return 'Пароль должен содержать заглавные и строчные буквы, а также цифры';
                      }
                      return null;
                    },
                    obscureText: isObscure,
                    decoration: InputDecoration(
                      hintText: 'Пароль',
                      suffixIcon: TextFieldObscure(isObscure: (value) {
                        setState(() {
                          isObscure = value;
                        });
                      }),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 400, top: 30, left: 400),
                  child: CustomButton(
                    content: 'Регистрация',
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        signUp();
                      } else {}
                    },
                  ),
                ),
                const Spacer(flex: 2),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(15),
                    ),
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signUp() async {
    final AuthRepositoryImlp auth = AuthRepositoryImlp();

    var result = await Auth(auth).signUp(AuthParams(
      login: _loginController.text,
      password: _passwordController.text,
    ));

    result.fold((l) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l.errorMessage),
        ),
      );
    }, (r) {
      Navigator.pushNamed(context, 'admin');
    });
  }
}
