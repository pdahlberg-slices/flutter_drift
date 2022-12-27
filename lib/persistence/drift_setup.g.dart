// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_setup.dart';

// ignore_for_file: type=lint
class EntityData extends DataClass implements Insertable<EntityData> {
  final int id;
  final String title;
  const EntityData({required this.id, required this.title});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    return map;
  }

  EntityCompanion toCompanion(bool nullToAbsent) {
    return EntityCompanion(
      id: Value(id),
      title: Value(title),
    );
  }

  factory EntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EntityData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
    };
  }

  EntityData copyWith({int? id, String? title}) => EntityData(
        id: id ?? this.id,
        title: title ?? this.title,
      );
  @override
  String toString() {
    return (StringBuffer('EntityData(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EntityData && other.id == this.id && other.title == this.title);
}

class EntityCompanion extends UpdateCompanion<EntityData> {
  final Value<int> id;
  final Value<String> title;
  const EntityCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
  });
  EntityCompanion.insert({
    this.id = const Value.absent(),
    required String title,
  }) : title = Value(title);
  static Insertable<EntityData> custom({
    Expression<int>? id,
    Expression<String>? title,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
    });
  }

  EntityCompanion copyWith({Value<int>? id, Value<String>? title}) {
    return EntityCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EntityCompanion(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }
}

class $EntityTable extends Entity with TableInfo<$EntityTable, EntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 6, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title];
  @override
  String get aliasedName => _alias ?? 'entity';
  @override
  String get actualTableName => 'entity';
  @override
  VerificationContext validateIntegrity(Insertable<EntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
    );
  }

  @override
  $EntityTable createAlias(String alias) {
    return $EntityTable(attachedDatabase, alias);
  }
}

abstract class _$SharedDatabase extends GeneratedDatabase {
  _$SharedDatabase(QueryExecutor e) : super(e);
  late final $EntityTable entity = $EntityTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [entity];
}
