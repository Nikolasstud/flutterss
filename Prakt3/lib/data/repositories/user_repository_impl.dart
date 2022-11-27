import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';

import '../../common/data_base_request.dart';
import '../../core/db/data_base_helper.dart';
import '../../core/exception/failure.dart';
import '../../domain/entity/role_entity.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/repositories/users_repositories.dart';
import '../model/user.dart';

class UserRepositoryImpl implements UserRepositories {
  final _db = DataBaseHelper.instance.database;

  @override
  String get table => DataBaseRequest.tableUser;

  @override
  Future<List<UserEntity>> getAll() async {
    return (await _db.rawQuery(DataBaseRequest.select(table)))
        .map((e) => User.toFromMap(e))
        .toList();
  }

  @override
  Future<Either<Failure, UserEntity>> insert(
      String login, String password, RoleEnum idRole) async {
    try {
      var value = User(login: login, idRole: idRole, password: password);
      await _db.insert(table, value.toMap());
      var result =
          await _db.rawQuery('SELECT * FROM $table ORDER BY id DESC LIMIT 1');
      return Right(result.map((e) => User.toFromMap(e)).first);
    } on DatabaseException catch (e) {
      return Left(FailureImpl(e.getResultCode()!).error);
    }
  }

  @override
  Future<Either<Failure, bool>> delete(int id) async {
    try {
      await _db.delete(table, where: 'id = ?', whereArgs: [id]);
      return right(true);
    } on DatabaseException catch (error) {
      print("${error.getResultCode()}");
      print("${error.result}");
      return left(FailureImpl(error.getResultCode()!).error);
    }
  }
}
