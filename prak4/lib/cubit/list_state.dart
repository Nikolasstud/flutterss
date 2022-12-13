part of 'list_cubit.dart';

@immutable
abstract class ListState {}

class ClickAdd extends ListState {}

class OnClickAdd extends ListState {}

class EmptyList extends ListState {}

class ListInitial extends ListState {}