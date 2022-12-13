part of 'click_cubit.dart';

@immutable
abstract class ClickState {}

class ClickInitial extends ClickState {}

class ClickAddLight extends ClickState{}

class ClickAddDark extends ClickState{}

class ClickRemoveLight extends ClickState{}

class ClickRemoveDark extends ClickState{}

class OnClick extends ClickState{}