import 'package:dartz/dartz.dart';

import '../../domain/entity/role_entity.dart';

abstract class AuthUserCase<Type, Params> {
  Future<Either<Type, RoleEnum>> signIn(Params params);
  Future<Either<Type, bool>> signUp(Params params);
}
