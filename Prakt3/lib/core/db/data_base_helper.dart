import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:prak2/data/model/tovar.dart';
import 'package:prak2/data/model/korzina.dart';
import 'package:prak2/data/model/type_tovar.dart';
import 'package:prak2/data/model/postav.dart';
import 'package:prak2/data/model/proizv.dart';
import 'package:prak2/data/model/color.dart';
import 'package:prak2/data/model/materials.dart';
import 'package:prak2/domain/entity/role_entity.dart';
import 'package:prak2/domain/entity/type_tovar_entity.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../../common/data_base_request.dart';
import '../../data/model/role.dart';
import '../../data/model/user.dart';

class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._instance();

  DataBaseHelper._instance();

  late final Directory _appDocumentDirectory;
  late final String _pathDB;
  late final Database database;
  final int _version = 14;
 

  Future<void> init() async {
     _appDocumentDirectory = await getApplicationDocumentsDirectory();

    _pathDB = join(_appDocumentDirectory.path, 'tovar.db');

   if (Platform.isLinux || Platform.isWindows) {
      sqfliteFfiInit();
      database = await databaseFactoryFfi.openDatabase(_pathDB,
          options: OpenDatabaseOptions(
            version: _version,
            onUpgrade: (db, oldVersion, newVersion) async =>
              await onUpgradeTable(db),
          onCreate: (db, version) async {
            await onCreateTable(db);
          },
        ));
    } else {
      database = await openDatabase(
        _pathDB, 
        version: _version,
        onUpgrade: (db, oldVersion, newVersion) => onUpgradeTable(db),
        onCreate: (db, version) async {
        await onCreateTable(db);
      });
    }
  }

  Future<void> onCreateTable(Database db) async {
    for (var table in DataBaseRequest.tableCreateList) {
      await db.execute(table);
    }

    // db.execute('PRAGMA foreign_keys=on');
    await onInitTable(db);
  }

  Future<void> onInitTable(Database db) async {
    try {
      db.insert(DataBaseRequest.tableRole, Role(role: "Администратор").toMap());
      db.insert(DataBaseRequest.tableRole, Role(role: "Пользователь").toMap());

      db.insert(
          DataBaseRequest.tableUser,
          User(
                  login: "loginn",
                  password: "Loginin12",
                  idRole: RoleEnum.user)
              .toMap());
      db.insert(
          DataBaseRequest.tableUser,
          User(
                  login: "users",
                  password: "Usersis1",
                  idRole: RoleEnum.admin)
              .toMap());

      db.insert(DataBaseRequest.tableProizv, Proizv(name: "Сима_ленд").toMap());
      db.insert(DataBaseRequest.tableProizv, Proizv(name: "Индиго").toMap());
      db.insert(DataBaseRequest.tableProizv, Proizv(name: "Ice").toMap());

      db.insert(DataBaseRequest.tablePostav, Postav(name: "Trendoptom").toMap());
      db.insert(DataBaseRequest.tablePostav, Postav(name: "Евроком").toMap());
      db.insert(DataBaseRequest.tablePostav, Postav(name: "Эврика").toMap());
      
      db.insert(DataBaseRequest.tableColor, Color(name: "Красный").toMap());
      db.insert(DataBaseRequest.tableColor, Color(name: "Черный").toMap());
      db.insert(DataBaseRequest.tableColor, Color(name: "Зеленый").toMap());
      db.insert(DataBaseRequest.tableColor, Color(name: "Синий").toMap());

      db.insert(DataBaseRequest.tableMaterials, Materials(name: "Метал").toMap());
      db.insert(DataBaseRequest.tableMaterials, Materials(name: "Пластик").toMap());
      db.insert(DataBaseRequest.tableMaterials, Materials(name: "Карбон").toMap());

      db.insert(DataBaseRequest.tableTypeTovar, TypeTovar(name: "Коробка передач").toMap());
      db.insert(DataBaseRequest.tableTypeTovar, TypeTovar(name: "Дверь").toMap());
      db.insert(DataBaseRequest.tableTypeTovar, TypeTovar(name: "Стекло").toMap());

      db.insert(
          DataBaseRequest.tableTovar,
          Tovar(
                  articul: "123456",
                  ves: "1500 гр",
                  idProizv: 2,
                  idPostav: 3,
                  idMaterials: 1,
                  idTypetovara: 1,
                  idColor:1)
              .toMap());
      db.insert(
          DataBaseRequest.tableTovar,
          Tovar(
                  articul: "543654",
                  ves: "2500 гр",
                  idProizv: 1,
                  idPostav: 2,
                  idMaterials: 2,
                  idTypetovara: 3,
                  idColor:3)
              .toMap());
      db.insert(DataBaseRequest.tableTovar, Tovar(articul: "656565", ves: "6500 гр", idProizv: 2, idPostav: 3, idMaterials: 1, idTypetovara: 1, idColor: 1).toMap());
      db.insert(DataBaseRequest.tableTovar, Tovar(articul: "676767", ves: "3400 гр", idProizv: 1, idPostav: 2, idMaterials: 2, idTypetovara: 3, idColor: 3).toMap());
      
      
      db.insert(
          DataBaseRequest.tableKorzina, Korzina(kolvo: "2", idTovar: 1, idUser: 1).toMap());
      db.insert(
          DataBaseRequest.tableKorzina, Korzina(kolvo: "1", idTovar: 2, idUser: 2).toMap());

    } on DatabaseException catch (e) {}
  }

  Future<void> onUpgradeTable(Database db) async {
    var tables = await db.rawQuery('SELECT name  FROM sqlite_master;');
    for (var table in DataBaseRequest.tableList.reversed) {
      if (tables.where((element) => element['name'] == table).isNotEmpty) {
        await db.execute(DataBaseRequest.deleteTable(table));
      }
    }
    for (var createTable in DataBaseRequest.tableCreateList) {
      await db.execute(createTable);
    }
    await onInitTable(db);
  }

  Future<void> onDropDataBase() async {
    database.close();

    if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      databaseFactoryFfi.deleteDatabase(_pathDB);
    } else {
      await deleteDatabase(_pathDB);
    }
  }
}
