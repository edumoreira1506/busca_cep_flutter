import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'database.g.dart';

class ZipCodeData extends Table {
  TextColumn get cep => text()();
  TextColumn get estado => text()();
  TextColumn get localidade => text()();
  TextColumn get bairro => text()();
  TextColumn get logradouro => text()();
}

@DriftDatabase(tables: [ZipCodeData])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'zipcodedatabase');
  }
}
