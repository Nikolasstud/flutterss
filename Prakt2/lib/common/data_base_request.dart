abstract class DataBaseRequest {
  static const String tableRole = 'Role';
  static const String tableUser = 'User';
  static const String tableTovar = 'Tovar';
  static const String tableProizv = 'Proizv';
  static const String tableColor = 'Color';
  static const String tablePostav = 'Postav';
  static const String tableMaterials = 'Materials';
  static const String tableTypeTovar = 'TypeTovar';
  static const String tableKorzina = 'Korzina';

  static const List<String> tableList = [
    tableRole,
    tableUser,
    tableTovar,
    tableProizv,
    tableColor,
    tablePostav,
    tableMaterials,
    tableTypeTovar,
    tableKorzina,
  ];

  static const List<String> tableCreateList = [
    _createTableRole,
    _createTableUser,
    _createTableTovar,
    _createTableProizv,
    _createTableColor,
    _createTablePostav,
    _createTableMaterials,
    _createTableTypeTovar,
    _createTableKorzina,
  ];

  static const String _createTableRole =
      'CREATE TABLE "$tableRole" ("id" INTEGER,"role" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

  static const String _createTableUser =
      'CREATE TABLE "$tableUser" ("id" INTEGER,"login" TEXT NOT NULL UNIQUE,"password" TEXT NOT NULL, "id_role" INTEGER NOT NULL, PRIMARY KEY("id" AUTOINCREMENT), FOREIGN KEY("id_role") REFERENCES "Role"("id"))';
  
  static const String _createTableTovar =
      'CREATE TABLE "$tableTovar" ("id" INTEGER,"articul" TEXT NOT NULL UNIQUE, "ves" TEXT NOT NULL, "id_proizv" INTEGER NOT NULL, "id_postav" INTEGER NOT NULL, "id_materials" INTEGER NOT NULL, "id_typetovara" INTEGER NOT NULL, "id_color" INTEGER NOT NULL, PRIMARY KEY("id" AUTOINCREMENT), FOREIGN KEY("id_proizv") REFERENCES "Proizv"("id"), FOREIGN KEY("id_postav") REFERENCES "Postav"("id"), FOREIGN KEY("id_materials") REFERENCES "Materials"("id"), FOREIGN KEY("id_typetovara") REFERENCES "TypeTovar"("id"), FOREIGN KEY("id_color") REFERENCES "Color"("id"))';
  
  static const String _createTableProizv =
      'CREATE TABLE "$tableProizv" ("id" INTEGER,"name" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';
  
  static const String _createTableColor =
      'CREATE TABLE "$tableColor" ("id" INTEGER,"name" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';
  
  static const String _createTablePostav =
      'CREATE TABLE "$tablePostav" ("id" INTEGER,"name" TEXT NOT NULL, PRIMARY KEY("id" AUTOINCREMENT))';
  
  static const String _createTableMaterials =
      'CREATE TABLE "$tableMaterials" ("id" INTEGER,"name" INTEGER NOT NULL, PRIMARY KEY("id" AUTOINCREMENT))';
  
  static const String _createTableTypeTovar =
      'CREATE TABLE "$tableTypeTovar" ("id" INTEGER,"name" INTEGER NOT NULL, PRIMARY KEY("id" AUTOINCREMENT))';
  
  static const String _createTableKorzina =
      'CREATE TABLE "$tableKorzina" ("id" INTEGER,"kolvo" TEXT NOT NULL,"id_user" INTEGER NOT NULL, "id_tovar" INTEGER NOT NULL, PRIMARY KEY("id" AUTOINCREMENT), FOREIGN KEY("id_user") REFERENCES "User"("id"), FOREIGN KEY("id_tovar") REFERENCES "Tovar"("id"))';

  static String deleteTable(String table) => 'DROP TABLE $table';
}
