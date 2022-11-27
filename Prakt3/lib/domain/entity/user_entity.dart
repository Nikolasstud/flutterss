import 'package:prak2/domain/entity/role_entity.dart';

class UserEntity {
  late int id;
  final String login;
  final String password;
  final RoleEnum idRole;

  bool isSelect;

  UserEntity(
      {this.id = 0,
      required this.login,
      this.password = '',
      required this.idRole,
      this.isSelect = false,});
}
