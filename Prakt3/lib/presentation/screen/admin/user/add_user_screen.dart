import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entity/role_entity.dart';
import '../../../state/users_cubit.dart';
import '../../../widgets/custom_button.dart';

class AddUserScreen extends StatelessWidget {
  AddUserScreen({super.key});

  RoleEnum _roleEnum = RoleEnum.admin;

  final _loginContoller = TextEditingController();
  final _passwordContoller = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавление пользователя'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _loginContoller,
                  maxLength: 30,
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
                    labelText: 'Логин',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordContoller,
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
                  maxLength: 22,
                  decoration: const InputDecoration(
                    labelText: 'Пароль',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField(
                  value: RoleEnum.admin,
                  decoration: const InputDecoration(
                    labelText: 'Тип пользователя',
                    border: OutlineInputBorder(),
                  ),
                  items: RoleEnum.values.map((e) {
                    return DropdownMenuItem<RoleEnum>(
                        value: e, child: Text(e.name));
                  }).toList(),
                  onChanged: (value) {
                    _roleEnum = value!;
                  },
                ),
                const SizedBox(height: 10),
                CustomButton(
                  content: 'Добавить пользователя',
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      BlocProvider.of<UsersCubit>(context).add(
                        _loginContoller.text,
                        _passwordContoller.text,
                        _roleEnum,
                        context,
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
