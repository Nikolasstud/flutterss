import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prakk5/main.dart';

import 'cubit/tema_cubit.dart';

class Screen extends StatelessWidget {
  const Screen({super.key, required this.count});

  final int count;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Число'),
            Text(count.toString(),
            style: Theme.of(context).textTheme.headline4,),
            IconButton(
                onPressed: () {
                  context
                      .read<TemaCubit>()
                      .onClickLight(Theme.of(context).brightness);
                },
                icon: const Icon(Icons.settings),
              ),
          ]),
          
    ));
  }
}
