import '../../domain/entity/type_tovar_entity.dart';

class TypeTovar extends TypetovarEntity {
  late int id;
  final String name;

  TypeTovar({required this.name}) : super(name: name);

  Map<String, dynamic> toMap() {
    return {'name': name};
  }

  factory TypeTovar.toFromMap(Map<String, dynamic> json) {
    return TypeTovar(name: json['name']);
  }
}