import 'package:flutter/material.dart';

import '../../../data/repositories/auth_repository_impl.dart';
import '../../../domain/entity/role_entity.dart';
import '../../../domain/usercases/auth.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/text_field_obscure.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  GlobalKey<FormState> _key = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _loginController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool isObscure = true;
  bool _isValid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Expanded(child: SizedBox()),
                const Text(
                  'Авторизация',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w600,),
                ),
                const Expanded(child: SizedBox()),
                Container(
                  margin: const EdgeInsets.only(right: 300, bottom: 7, left: 300),
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  maxLength: 30,
                  controller: _loginController,
                  validator: (value) {
                    if (!_isValid) {
                      return null;
                    }
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
                    labelText: 'Логин',
                    border: OutlineInputBorder(),
                  ),
                ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 300, bottom: 7, left: 300),
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  maxLength: 22,
                  controller: _passwordController,
                  validator: (value) {
                    if (!_isValid) {
                      return null;
                    }
                    if (value!.isEmpty) {
                      return 'Не должно быть пустым';
                    }
                    if (value.length < 8) {
                      return 'Пароль должен быть не меньше 8 символов';
                    }
                     if (!RegExp("^(?=.*[a-z])")
                        .hasMatch(value)) {
                      return 'Пароль должен содержать только латинские буквы';
                    }
                    return null;
                  },
                  obscureText: isObscure,
                  decoration: InputDecoration(
                    labelText: 'Пароль',
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
                  child:CustomButton(
                  content: 'Войти',
                  onPressed: () {
                    _isValid = true;
                    if (_key.currentState!.validate()) {
                      signIn();
                    } else {}
                  },
                ),),
                const Expanded(flex: 3, child: SizedBox()),
                InkWell(
                  borderRadius: BorderRadius.circular(4),
                  onTap: () {
                    _loginController.clear();
                    _passwordController.clear();
                    _isValid = false;
                    _key.currentState!.validate();
                    Navigator.pushNamed(context, 'sign_up');
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      'Регистрация',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signIn() async {
    final AuthRepositoryImlp auth = AuthRepositoryImlp();
    var result = await Auth(auth).signIn(AuthParams(
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
      switch (r) {
        case RoleEnum.admin:
          {
            Navigator.pushReplacementNamed(context, 'admin');
            break;
          }
        case RoleEnum.user:
          Navigator.pushNamedAndRemoveUntil(
              context, 'client', (route) => false);
          break;
      }
    });
  }
}
