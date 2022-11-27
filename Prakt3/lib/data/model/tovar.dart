import '../../domain/entity/tovar_entity.dart';

class Tovar extends TovarEntity {
  Tovar({required super.articul,
    required super.ves,
    required super.idProizv,
    required super.idPostav,
    required super.idMaterials,
    required super.idTypetovara,
    required super.idColor,
  });

  Map<String, dynamic> toMap() {
    return {
      'articul': articul,
      'ves': ves,
      'id_proizv': idProizv,
      'id_postav': idPostav,
      'id_materials': idMaterials,
      'id_typetovara': idTypetovara,
      'id_color': idColor,
    };
  }

  factory Tovar.toFromMap(Map<String, dynamic> json) {
    return Tovar(
        articul: json['articul'],
        ves: json['ves'],
        idProizv: json['id_proizv'],
        idPostav: json['id_postav'],
        idMaterials: json['id_materials'],
        idTypetovara: json['id_typetovara'],
        idColor: json['id_color']);
  }
}
