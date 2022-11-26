import '../../domain/postav_entity.dart';

class Postav extends PostavEntity {
  late int id;
  final String name;

  Postav({required this.name}) : super(name: name);

  Map<String, dynamic> toMap() {
    return {'name': name};
  }

  factory Postav.toFromMap(Map<String, dynamic> json) {
    return Postav(name: json['name']);
  }
}