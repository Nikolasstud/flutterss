part of 'users_cubit.dart';

@immutable
abstract class UsersState {}

class UsersInitial extends UsersState {}

class UsersLoad extends UsersState {}

class UsersLoaded extends UsersState {
  final List<UserEntity> list;

  UsersLoaded(this.list);
}


class UserDelete extends UsersState{
  final List<UserEntity> list;

  UserDelete(this.list);
}