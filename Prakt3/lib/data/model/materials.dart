import '../../domain/entity/materials_entity.dart';

class Materials extends MaterialsEntity {
  late int id;
  final String name;

  Materials({required this.name}) : super(name: name);

  Map<String, dynamic> toMap() {
    return {'name': name};
  }

  factory Materials.toFromMap(Map<String, dynamic> json) {
    return Materials(name: json['name']);
  }
}