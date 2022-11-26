import '../../domain/korzina_entity.dart';

class Korzina extends KorzinaEntity {
  Korzina({required super.kolvo,
    required super.idUser,
    required super.idTovar,
  });

  Map<String, dynamic> toMap() {
    return {
      'kolvo': kolvo,
      'id_user': idUser,
      'id_tovar': idTovar,
    };
  }

  factory Korzina.toFromMap(Map<String, dynamic> json) {
    return Korzina(
        kolvo: json['kolvo'],
        idUser: json['id_user'],
        idTovar: json['id_tovar']);
  }
}
