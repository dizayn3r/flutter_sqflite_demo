// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class EmployeeData extends DataClass implements Insertable<EmployeeData> {
  final int id;
  final String userName;
  final String firstName;
  final String lastName;
  final DateTime dob;
  EmployeeData(
      {required this.id,
      required this.userName,
      required this.firstName,
      required this.lastName,
      required this.dob});
  factory EmployeeData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return EmployeeData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      userName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_name'])!,
      firstName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}first_name'])!,
      lastName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_name'])!,
      dob: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date_of_birth'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_name'] = Variable<String>(userName);
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    map['date_of_birth'] = Variable<DateTime>(dob);
    return map;
  }

  EmployeeCompanion toCompanion(bool nullToAbsent) {
    return EmployeeCompanion(
      id: Value(id),
      userName: Value(userName),
      firstName: Value(firstName),
      lastName: Value(lastName),
      dob: Value(dob),
    );
  }

  factory EmployeeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EmployeeData(
      id: serializer.fromJson<int>(json['id']),
      userName: serializer.fromJson<String>(json['userName']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      dob: serializer.fromJson<DateTime>(json['dob']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userName': serializer.toJson<String>(userName),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'dob': serializer.toJson<DateTime>(dob),
    };
  }

  EmployeeData copyWith(
          {int? id,
          String? userName,
          String? firstName,
          String? lastName,
          DateTime? dob}) =>
      EmployeeData(
        id: id ?? this.id,
        userName: userName ?? this.userName,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        dob: dob ?? this.dob,
      );
  @override
  String toString() {
    return (StringBuffer('EmployeeData(')
          ..write('id: $id, ')
          ..write('userName: $userName, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('dob: $dob')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userName, firstName, lastName, dob);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EmployeeData &&
          other.id == this.id &&
          other.userName == this.userName &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.dob == this.dob);
}

class EmployeeCompanion extends UpdateCompanion<EmployeeData> {
  final Value<int> id;
  final Value<String> userName;
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<DateTime> dob;
  const EmployeeCompanion({
    this.id = const Value.absent(),
    this.userName = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.dob = const Value.absent(),
  });
  EmployeeCompanion.insert({
    this.id = const Value.absent(),
    required String userName,
    required String firstName,
    required String lastName,
    required DateTime dob,
  })  : userName = Value(userName),
        firstName = Value(firstName),
        lastName = Value(lastName),
        dob = Value(dob);
  static Insertable<EmployeeData> custom({
    Expression<int>? id,
    Expression<String>? userName,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<DateTime>? dob,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userName != null) 'user_name': userName,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (dob != null) 'date_of_birth': dob,
    });
  }

  EmployeeCompanion copyWith(
      {Value<int>? id,
      Value<String>? userName,
      Value<String>? firstName,
      Value<String>? lastName,
      Value<DateTime>? dob}) {
    return EmployeeCompanion(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      dob: dob ?? this.dob,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userName.present) {
      map['user_name'] = Variable<String>(userName.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (dob.present) {
      map['date_of_birth'] = Variable<DateTime>(dob.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EmployeeCompanion(')
          ..write('id: $id, ')
          ..write('userName: $userName, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('dob: $dob')
          ..write(')'))
        .toString();
  }
}

class $EmployeeTable extends Employee
    with TableInfo<$EmployeeTable, EmployeeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EmployeeTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _userNameMeta = const VerificationMeta('userName');
  @override
  late final GeneratedColumn<String?> userName = GeneratedColumn<String?>(
      'user_name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _firstNameMeta = const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String?> firstName = GeneratedColumn<String?>(
      'first_name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _lastNameMeta = const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String?> lastName = GeneratedColumn<String?>(
      'last_name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _dobMeta = const VerificationMeta('dob');
  @override
  late final GeneratedColumn<DateTime?> dob = GeneratedColumn<DateTime?>(
      'date_of_birth', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, userName, firstName, lastName, dob];
  @override
  String get aliasedName => _alias ?? 'employee';
  @override
  String get actualTableName => 'employee';
  @override
  VerificationContext validateIntegrity(Insertable<EmployeeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_name')) {
      context.handle(_userNameMeta,
          userName.isAcceptableOrUnknown(data['user_name']!, _userNameMeta));
    } else if (isInserting) {
      context.missing(_userNameMeta);
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('date_of_birth')) {
      context.handle(_dobMeta,
          dob.isAcceptableOrUnknown(data['date_of_birth']!, _dobMeta));
    } else if (isInserting) {
      context.missing(_dobMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EmployeeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return EmployeeData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $EmployeeTable createAlias(String alias) {
    return $EmployeeTable(attachedDatabase, alias);
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $EmployeeTable employee = $EmployeeTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [employee];
}