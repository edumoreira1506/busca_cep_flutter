// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ZipCodeDataTable extends ZipCodeData
    with TableInfo<$ZipCodeDataTable, ZipCodeDataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ZipCodeDataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _cepMeta = const VerificationMeta('cep');
  @override
  late final GeneratedColumn<String> cep = GeneratedColumn<String>(
      'cep', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _estadoMeta = const VerificationMeta('estado');
  @override
  late final GeneratedColumn<String> estado = GeneratedColumn<String>(
      'estado', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _localidadeMeta =
      const VerificationMeta('localidade');
  @override
  late final GeneratedColumn<String> localidade = GeneratedColumn<String>(
      'localidade', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _bairroMeta = const VerificationMeta('bairro');
  @override
  late final GeneratedColumn<String> bairro = GeneratedColumn<String>(
      'bairro', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _logradouroMeta =
      const VerificationMeta('logradouro');
  @override
  late final GeneratedColumn<String> logradouro = GeneratedColumn<String>(
      'logradouro', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [cep, estado, localidade, bairro, logradouro];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'zip_code_data';
  @override
  VerificationContext validateIntegrity(Insertable<ZipCodeDataData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('cep')) {
      context.handle(
          _cepMeta, cep.isAcceptableOrUnknown(data['cep']!, _cepMeta));
    } else if (isInserting) {
      context.missing(_cepMeta);
    }
    if (data.containsKey('estado')) {
      context.handle(_estadoMeta,
          estado.isAcceptableOrUnknown(data['estado']!, _estadoMeta));
    } else if (isInserting) {
      context.missing(_estadoMeta);
    }
    if (data.containsKey('localidade')) {
      context.handle(
          _localidadeMeta,
          localidade.isAcceptableOrUnknown(
              data['localidade']!, _localidadeMeta));
    } else if (isInserting) {
      context.missing(_localidadeMeta);
    }
    if (data.containsKey('bairro')) {
      context.handle(_bairroMeta,
          bairro.isAcceptableOrUnknown(data['bairro']!, _bairroMeta));
    } else if (isInserting) {
      context.missing(_bairroMeta);
    }
    if (data.containsKey('logradouro')) {
      context.handle(
          _logradouroMeta,
          logradouro.isAcceptableOrUnknown(
              data['logradouro']!, _logradouroMeta));
    } else if (isInserting) {
      context.missing(_logradouroMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ZipCodeDataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ZipCodeDataData(
      cep: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cep'])!,
      estado: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}estado'])!,
      localidade: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}localidade'])!,
      bairro: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bairro'])!,
      logradouro: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}logradouro'])!,
    );
  }

  @override
  $ZipCodeDataTable createAlias(String alias) {
    return $ZipCodeDataTable(attachedDatabase, alias);
  }
}

class ZipCodeDataData extends DataClass implements Insertable<ZipCodeDataData> {
  final String cep;
  final String estado;
  final String localidade;
  final String bairro;
  final String logradouro;
  const ZipCodeDataData(
      {required this.cep,
      required this.estado,
      required this.localidade,
      required this.bairro,
      required this.logradouro});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['cep'] = Variable<String>(cep);
    map['estado'] = Variable<String>(estado);
    map['localidade'] = Variable<String>(localidade);
    map['bairro'] = Variable<String>(bairro);
    map['logradouro'] = Variable<String>(logradouro);
    return map;
  }

  ZipCodeDataCompanion toCompanion(bool nullToAbsent) {
    return ZipCodeDataCompanion(
      cep: Value(cep),
      estado: Value(estado),
      localidade: Value(localidade),
      bairro: Value(bairro),
      logradouro: Value(logradouro),
    );
  }

  factory ZipCodeDataData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ZipCodeDataData(
      cep: serializer.fromJson<String>(json['cep']),
      estado: serializer.fromJson<String>(json['estado']),
      localidade: serializer.fromJson<String>(json['localidade']),
      bairro: serializer.fromJson<String>(json['bairro']),
      logradouro: serializer.fromJson<String>(json['logradouro']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cep': serializer.toJson<String>(cep),
      'estado': serializer.toJson<String>(estado),
      'localidade': serializer.toJson<String>(localidade),
      'bairro': serializer.toJson<String>(bairro),
      'logradouro': serializer.toJson<String>(logradouro),
    };
  }

  ZipCodeDataData copyWith(
          {String? cep,
          String? estado,
          String? localidade,
          String? bairro,
          String? logradouro}) =>
      ZipCodeDataData(
        cep: cep ?? this.cep,
        estado: estado ?? this.estado,
        localidade: localidade ?? this.localidade,
        bairro: bairro ?? this.bairro,
        logradouro: logradouro ?? this.logradouro,
      );
  ZipCodeDataData copyWithCompanion(ZipCodeDataCompanion data) {
    return ZipCodeDataData(
      cep: data.cep.present ? data.cep.value : this.cep,
      estado: data.estado.present ? data.estado.value : this.estado,
      localidade:
          data.localidade.present ? data.localidade.value : this.localidade,
      bairro: data.bairro.present ? data.bairro.value : this.bairro,
      logradouro:
          data.logradouro.present ? data.logradouro.value : this.logradouro,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ZipCodeDataData(')
          ..write('cep: $cep, ')
          ..write('estado: $estado, ')
          ..write('localidade: $localidade, ')
          ..write('bairro: $bairro, ')
          ..write('logradouro: $logradouro')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(cep, estado, localidade, bairro, logradouro);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ZipCodeDataData &&
          other.cep == this.cep &&
          other.estado == this.estado &&
          other.localidade == this.localidade &&
          other.bairro == this.bairro &&
          other.logradouro == this.logradouro);
}

class ZipCodeDataCompanion extends UpdateCompanion<ZipCodeDataData> {
  final Value<String> cep;
  final Value<String> estado;
  final Value<String> localidade;
  final Value<String> bairro;
  final Value<String> logradouro;
  final Value<int> rowid;
  const ZipCodeDataCompanion({
    this.cep = const Value.absent(),
    this.estado = const Value.absent(),
    this.localidade = const Value.absent(),
    this.bairro = const Value.absent(),
    this.logradouro = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ZipCodeDataCompanion.insert({
    required String cep,
    required String estado,
    required String localidade,
    required String bairro,
    required String logradouro,
    this.rowid = const Value.absent(),
  })  : cep = Value(cep),
        estado = Value(estado),
        localidade = Value(localidade),
        bairro = Value(bairro),
        logradouro = Value(logradouro);
  static Insertable<ZipCodeDataData> custom({
    Expression<String>? cep,
    Expression<String>? estado,
    Expression<String>? localidade,
    Expression<String>? bairro,
    Expression<String>? logradouro,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (cep != null) 'cep': cep,
      if (estado != null) 'estado': estado,
      if (localidade != null) 'localidade': localidade,
      if (bairro != null) 'bairro': bairro,
      if (logradouro != null) 'logradouro': logradouro,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ZipCodeDataCompanion copyWith(
      {Value<String>? cep,
      Value<String>? estado,
      Value<String>? localidade,
      Value<String>? bairro,
      Value<String>? logradouro,
      Value<int>? rowid}) {
    return ZipCodeDataCompanion(
      cep: cep ?? this.cep,
      estado: estado ?? this.estado,
      localidade: localidade ?? this.localidade,
      bairro: bairro ?? this.bairro,
      logradouro: logradouro ?? this.logradouro,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cep.present) {
      map['cep'] = Variable<String>(cep.value);
    }
    if (estado.present) {
      map['estado'] = Variable<String>(estado.value);
    }
    if (localidade.present) {
      map['localidade'] = Variable<String>(localidade.value);
    }
    if (bairro.present) {
      map['bairro'] = Variable<String>(bairro.value);
    }
    if (logradouro.present) {
      map['logradouro'] = Variable<String>(logradouro.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ZipCodeDataCompanion(')
          ..write('cep: $cep, ')
          ..write('estado: $estado, ')
          ..write('localidade: $localidade, ')
          ..write('bairro: $bairro, ')
          ..write('logradouro: $logradouro, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ZipCodeDataTable zipCodeData = $ZipCodeDataTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [zipCodeData];
}

typedef $$ZipCodeDataTableCreateCompanionBuilder = ZipCodeDataCompanion
    Function({
  required String cep,
  required String estado,
  required String localidade,
  required String bairro,
  required String logradouro,
  Value<int> rowid,
});
typedef $$ZipCodeDataTableUpdateCompanionBuilder = ZipCodeDataCompanion
    Function({
  Value<String> cep,
  Value<String> estado,
  Value<String> localidade,
  Value<String> bairro,
  Value<String> logradouro,
  Value<int> rowid,
});

class $$ZipCodeDataTableFilterComposer
    extends Composer<_$AppDatabase, $ZipCodeDataTable> {
  $$ZipCodeDataTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get cep => $composableBuilder(
      column: $table.cep, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get estado => $composableBuilder(
      column: $table.estado, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get localidade => $composableBuilder(
      column: $table.localidade, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bairro => $composableBuilder(
      column: $table.bairro, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get logradouro => $composableBuilder(
      column: $table.logradouro, builder: (column) => ColumnFilters(column));
}

class $$ZipCodeDataTableOrderingComposer
    extends Composer<_$AppDatabase, $ZipCodeDataTable> {
  $$ZipCodeDataTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get cep => $composableBuilder(
      column: $table.cep, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get estado => $composableBuilder(
      column: $table.estado, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get localidade => $composableBuilder(
      column: $table.localidade, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bairro => $composableBuilder(
      column: $table.bairro, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get logradouro => $composableBuilder(
      column: $table.logradouro, builder: (column) => ColumnOrderings(column));
}

class $$ZipCodeDataTableAnnotationComposer
    extends Composer<_$AppDatabase, $ZipCodeDataTable> {
  $$ZipCodeDataTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get cep =>
      $composableBuilder(column: $table.cep, builder: (column) => column);

  GeneratedColumn<String> get estado =>
      $composableBuilder(column: $table.estado, builder: (column) => column);

  GeneratedColumn<String> get localidade => $composableBuilder(
      column: $table.localidade, builder: (column) => column);

  GeneratedColumn<String> get bairro =>
      $composableBuilder(column: $table.bairro, builder: (column) => column);

  GeneratedColumn<String> get logradouro => $composableBuilder(
      column: $table.logradouro, builder: (column) => column);
}

class $$ZipCodeDataTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ZipCodeDataTable,
    ZipCodeDataData,
    $$ZipCodeDataTableFilterComposer,
    $$ZipCodeDataTableOrderingComposer,
    $$ZipCodeDataTableAnnotationComposer,
    $$ZipCodeDataTableCreateCompanionBuilder,
    $$ZipCodeDataTableUpdateCompanionBuilder,
    (
      ZipCodeDataData,
      BaseReferences<_$AppDatabase, $ZipCodeDataTable, ZipCodeDataData>
    ),
    ZipCodeDataData,
    PrefetchHooks Function()> {
  $$ZipCodeDataTableTableManager(_$AppDatabase db, $ZipCodeDataTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ZipCodeDataTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ZipCodeDataTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ZipCodeDataTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> cep = const Value.absent(),
            Value<String> estado = const Value.absent(),
            Value<String> localidade = const Value.absent(),
            Value<String> bairro = const Value.absent(),
            Value<String> logradouro = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ZipCodeDataCompanion(
            cep: cep,
            estado: estado,
            localidade: localidade,
            bairro: bairro,
            logradouro: logradouro,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String cep,
            required String estado,
            required String localidade,
            required String bairro,
            required String logradouro,
            Value<int> rowid = const Value.absent(),
          }) =>
              ZipCodeDataCompanion.insert(
            cep: cep,
            estado: estado,
            localidade: localidade,
            bairro: bairro,
            logradouro: logradouro,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ZipCodeDataTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ZipCodeDataTable,
    ZipCodeDataData,
    $$ZipCodeDataTableFilterComposer,
    $$ZipCodeDataTableOrderingComposer,
    $$ZipCodeDataTableAnnotationComposer,
    $$ZipCodeDataTableCreateCompanionBuilder,
    $$ZipCodeDataTableUpdateCompanionBuilder,
    (
      ZipCodeDataData,
      BaseReferences<_$AppDatabase, $ZipCodeDataTable, ZipCodeDataData>
    ),
    ZipCodeDataData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ZipCodeDataTableTableManager get zipCodeData =>
      $$ZipCodeDataTableTableManager(_db, _db.zipCodeData);
}
