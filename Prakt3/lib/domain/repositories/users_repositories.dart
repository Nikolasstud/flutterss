import 'package:dartz/dartz.dart';

import '../../core/exception/failure.dart';
import '../entity/role_entity.dart';
import '../entity/user_entity.dart';

abstract class UserRepositories {
  String get table;

  Future<List<UserEntity>> getAll();
  Future<Either<Failure, UserEntity>> insert(
    String login,
    String password,
    RoleEnum idRole,
  );
  Future<Either<Failure, bool>> delete(int id);
}
