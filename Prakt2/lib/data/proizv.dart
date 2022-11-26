import '../../domain/proizv_entity.dart';

class Proizv extends ProizvEntity {
  late int id;
  final String name;

  Proizv({required this.name}) : super(name: name);

  Map<String, dynamic> toMap() {
    return {'name': name};
  }

  factory Proizv.toFromMap(Map<String, dynamic> json) {
    return Proizv(name: json['name']);
  }
}