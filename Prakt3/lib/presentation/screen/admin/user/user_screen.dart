import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prak2/presentation/screen/admin/user/widget/card_users.dart';

import '../../../state//users_cubit.dart';
import '../../../widgets/action_card.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<UsersCubit>().refresh(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BlocConsumer<UsersCubit, UsersState>(
            listener: (context, state) {
              if (state is UsersLoaded) {
                count = state.list.length;
              }
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'Количество пользователей: ${count}',
                  textAlign: TextAlign.left,
                ),
              );
            },
          ),
          BlocBuilder<UsersCubit, UsersState>(
            builder: (context, state) {
              if (state is UsersLoad) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is UsersLoaded) {
                if (state.list.isEmpty) {
                  return const Center(
                    child: Text('Данных нет'),
                  );
                }

                return Expanded(
                  child: ListView.builder(
                    itemCount: state.list.length,
                    itemBuilder: (context, index) {
                      final test = state.list[index];
                      return Dismissible(
                        key: Key(test.id.toString()),
                        child: CardUser(
                          onTap: () {
                            context.read<UsersCubit>();
                          },
                          id: state.list[index].id,
                          login: state.list[index].login,
                          idRole: state.list[index].idRole,
                        ),
                      );
                    },
                  ),
                );
              }

              return Container();
            },
          ),
        ],
      ),
    );
  }
}
