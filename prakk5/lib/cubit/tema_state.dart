part of 'tema_cubit.dart';

@immutable
abstract class TemaState {}

class TemaInitial extends TemaState {}

class clickTemaLight extends TemaState {
  // var result;
  TemaCubit temaLight;
  clickTemaLight(this.temaLight);
}

class clickTemaDark extends TemaState {
  // var result;
  TemaCubit temaDark;
  clickTemaDark(this.temaDark);
}
