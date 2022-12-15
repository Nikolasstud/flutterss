import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'tema_state.dart';
class TemaCubit extends Cubit<Brightness> {
  TemaCubit() : super(Brightness.light);

  void onClickLight(Brightness brightness) {
    if (brightness == Brightness.dark) {
      brightness = Brightness.light;
    } else {
      brightness = Brightness.dark;
    }
  }
}
