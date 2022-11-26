class RoleEntity {
  late int id;
  final String role;

  RoleEntity({required this.role});
}

enum RoleEnum {
  admin(id: 1, name: "администратор"),
  user(id: 2, name: "пользователь");

  const RoleEnum({required this.id, required this.name});

  final int id;
  final String name;
}
