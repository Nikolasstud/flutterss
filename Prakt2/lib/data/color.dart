import '../../domain/color_entity.dart';

class Color extends ColorEntity {
  late int id;
  final String name;

  Color({required this.name}) : super(name: name);

  Map<String, dynamic> toMap() {
    return {'name': name};
  }

  factory Color.toFromMap(Map<String, dynamic> json) {
    return Color(name: json['name']);
  }
}