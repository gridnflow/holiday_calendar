// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $HolidayTableTable extends HolidayTable
    with TableInfo<$HolidayTableTable, HolidayTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HolidayTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _apiIdMeta = const VerificationMeta('apiId');
  @override
  late final GeneratedColumn<String> apiId = GeneratedColumn<String>(
    'api_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _localNameMeta = const VerificationMeta(
    'localName',
  );
  @override
  late final GeneratedColumn<String> localName = GeneratedColumn<String>(
    'local_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _countryCodeMeta = const VerificationMeta(
    'countryCode',
  );
  @override
  late final GeneratedColumn<String> countryCode = GeneratedColumn<String>(
    'country_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fixedMeta = const VerificationMeta('fixed');
  @override
  late final GeneratedColumn<bool> fixed = GeneratedColumn<bool>(
    'fixed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("fixed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _globalMeta = const VerificationMeta('global');
  @override
  late final GeneratedColumn<bool> global = GeneratedColumn<bool>(
    'global',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("global" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _countiesMeta = const VerificationMeta(
    'counties',
  );
  @override
  late final GeneratedColumn<String> counties = GeneratedColumn<String>(
    'counties',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _typesMeta = const VerificationMeta('types');
  @override
  late final GeneratedColumn<String> types = GeneratedColumn<String>(
    'types',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<int> year = GeneratedColumn<int>(
    'year',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cachedAtMeta = const VerificationMeta(
    'cachedAt',
  );
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
    'cached_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    apiId,
    date,
    localName,
    name,
    countryCode,
    fixed,
    global,
    counties,
    types,
    year,
    cachedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'holiday_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<HolidayTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('api_id')) {
      context.handle(
        _apiIdMeta,
        apiId.isAcceptableOrUnknown(data['api_id']!, _apiIdMeta),
      );
    } else if (isInserting) {
      context.missing(_apiIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('local_name')) {
      context.handle(
        _localNameMeta,
        localName.isAcceptableOrUnknown(data['local_name']!, _localNameMeta),
      );
    } else if (isInserting) {
      context.missing(_localNameMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('country_code')) {
      context.handle(
        _countryCodeMeta,
        countryCode.isAcceptableOrUnknown(
          data['country_code']!,
          _countryCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_countryCodeMeta);
    }
    if (data.containsKey('fixed')) {
      context.handle(
        _fixedMeta,
        fixed.isAcceptableOrUnknown(data['fixed']!, _fixedMeta),
      );
    }
    if (data.containsKey('global')) {
      context.handle(
        _globalMeta,
        global.isAcceptableOrUnknown(data['global']!, _globalMeta),
      );
    }
    if (data.containsKey('counties')) {
      context.handle(
        _countiesMeta,
        counties.isAcceptableOrUnknown(data['counties']!, _countiesMeta),
      );
    }
    if (data.containsKey('types')) {
      context.handle(
        _typesMeta,
        types.isAcceptableOrUnknown(data['types']!, _typesMeta),
      );
    }
    if (data.containsKey('year')) {
      context.handle(
        _yearMeta,
        year.isAcceptableOrUnknown(data['year']!, _yearMeta),
      );
    } else if (isInserting) {
      context.missing(_yearMeta);
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {apiId, year};
  @override
  HolidayTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HolidayTableData(
      apiId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}api_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      localName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_name'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      countryCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}country_code'],
      )!,
      fixed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}fixed'],
      )!,
      global: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}global'],
      )!,
      counties: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}counties'],
      ),
      types: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}types'],
      ),
      year: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}year'],
      )!,
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
    );
  }

  @override
  $HolidayTableTable createAlias(String alias) {
    return $HolidayTableTable(attachedDatabase, alias);
  }
}

class HolidayTableData extends DataClass
    implements Insertable<HolidayTableData> {
  final String apiId;
  final DateTime date;
  final String localName;
  final String name;
  final String countryCode;
  final bool fixed;
  final bool global;
  final String? counties;
  final String? types;
  final int year;
  final DateTime cachedAt;
  const HolidayTableData({
    required this.apiId,
    required this.date,
    required this.localName,
    required this.name,
    required this.countryCode,
    required this.fixed,
    required this.global,
    this.counties,
    this.types,
    required this.year,
    required this.cachedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['api_id'] = Variable<String>(apiId);
    map['date'] = Variable<DateTime>(date);
    map['local_name'] = Variable<String>(localName);
    map['name'] = Variable<String>(name);
    map['country_code'] = Variable<String>(countryCode);
    map['fixed'] = Variable<bool>(fixed);
    map['global'] = Variable<bool>(global);
    if (!nullToAbsent || counties != null) {
      map['counties'] = Variable<String>(counties);
    }
    if (!nullToAbsent || types != null) {
      map['types'] = Variable<String>(types);
    }
    map['year'] = Variable<int>(year);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  HolidayTableCompanion toCompanion(bool nullToAbsent) {
    return HolidayTableCompanion(
      apiId: Value(apiId),
      date: Value(date),
      localName: Value(localName),
      name: Value(name),
      countryCode: Value(countryCode),
      fixed: Value(fixed),
      global: Value(global),
      counties: counties == null && nullToAbsent
          ? const Value.absent()
          : Value(counties),
      types: types == null && nullToAbsent
          ? const Value.absent()
          : Value(types),
      year: Value(year),
      cachedAt: Value(cachedAt),
    );
  }

  factory HolidayTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HolidayTableData(
      apiId: serializer.fromJson<String>(json['apiId']),
      date: serializer.fromJson<DateTime>(json['date']),
      localName: serializer.fromJson<String>(json['localName']),
      name: serializer.fromJson<String>(json['name']),
      countryCode: serializer.fromJson<String>(json['countryCode']),
      fixed: serializer.fromJson<bool>(json['fixed']),
      global: serializer.fromJson<bool>(json['global']),
      counties: serializer.fromJson<String?>(json['counties']),
      types: serializer.fromJson<String?>(json['types']),
      year: serializer.fromJson<int>(json['year']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'apiId': serializer.toJson<String>(apiId),
      'date': serializer.toJson<DateTime>(date),
      'localName': serializer.toJson<String>(localName),
      'name': serializer.toJson<String>(name),
      'countryCode': serializer.toJson<String>(countryCode),
      'fixed': serializer.toJson<bool>(fixed),
      'global': serializer.toJson<bool>(global),
      'counties': serializer.toJson<String?>(counties),
      'types': serializer.toJson<String?>(types),
      'year': serializer.toJson<int>(year),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  HolidayTableData copyWith({
    String? apiId,
    DateTime? date,
    String? localName,
    String? name,
    String? countryCode,
    bool? fixed,
    bool? global,
    Value<String?> counties = const Value.absent(),
    Value<String?> types = const Value.absent(),
    int? year,
    DateTime? cachedAt,
  }) => HolidayTableData(
    apiId: apiId ?? this.apiId,
    date: date ?? this.date,
    localName: localName ?? this.localName,
    name: name ?? this.name,
    countryCode: countryCode ?? this.countryCode,
    fixed: fixed ?? this.fixed,
    global: global ?? this.global,
    counties: counties.present ? counties.value : this.counties,
    types: types.present ? types.value : this.types,
    year: year ?? this.year,
    cachedAt: cachedAt ?? this.cachedAt,
  );
  HolidayTableData copyWithCompanion(HolidayTableCompanion data) {
    return HolidayTableData(
      apiId: data.apiId.present ? data.apiId.value : this.apiId,
      date: data.date.present ? data.date.value : this.date,
      localName: data.localName.present ? data.localName.value : this.localName,
      name: data.name.present ? data.name.value : this.name,
      countryCode: data.countryCode.present
          ? data.countryCode.value
          : this.countryCode,
      fixed: data.fixed.present ? data.fixed.value : this.fixed,
      global: data.global.present ? data.global.value : this.global,
      counties: data.counties.present ? data.counties.value : this.counties,
      types: data.types.present ? data.types.value : this.types,
      year: data.year.present ? data.year.value : this.year,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HolidayTableData(')
          ..write('apiId: $apiId, ')
          ..write('date: $date, ')
          ..write('localName: $localName, ')
          ..write('name: $name, ')
          ..write('countryCode: $countryCode, ')
          ..write('fixed: $fixed, ')
          ..write('global: $global, ')
          ..write('counties: $counties, ')
          ..write('types: $types, ')
          ..write('year: $year, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    apiId,
    date,
    localName,
    name,
    countryCode,
    fixed,
    global,
    counties,
    types,
    year,
    cachedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HolidayTableData &&
          other.apiId == this.apiId &&
          other.date == this.date &&
          other.localName == this.localName &&
          other.name == this.name &&
          other.countryCode == this.countryCode &&
          other.fixed == this.fixed &&
          other.global == this.global &&
          other.counties == this.counties &&
          other.types == this.types &&
          other.year == this.year &&
          other.cachedAt == this.cachedAt);
}

class HolidayTableCompanion extends UpdateCompanion<HolidayTableData> {
  final Value<String> apiId;
  final Value<DateTime> date;
  final Value<String> localName;
  final Value<String> name;
  final Value<String> countryCode;
  final Value<bool> fixed;
  final Value<bool> global;
  final Value<String?> counties;
  final Value<String?> types;
  final Value<int> year;
  final Value<DateTime> cachedAt;
  final Value<int> rowid;
  const HolidayTableCompanion({
    this.apiId = const Value.absent(),
    this.date = const Value.absent(),
    this.localName = const Value.absent(),
    this.name = const Value.absent(),
    this.countryCode = const Value.absent(),
    this.fixed = const Value.absent(),
    this.global = const Value.absent(),
    this.counties = const Value.absent(),
    this.types = const Value.absent(),
    this.year = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HolidayTableCompanion.insert({
    required String apiId,
    required DateTime date,
    required String localName,
    required String name,
    required String countryCode,
    this.fixed = const Value.absent(),
    this.global = const Value.absent(),
    this.counties = const Value.absent(),
    this.types = const Value.absent(),
    required int year,
    required DateTime cachedAt,
    this.rowid = const Value.absent(),
  }) : apiId = Value(apiId),
       date = Value(date),
       localName = Value(localName),
       name = Value(name),
       countryCode = Value(countryCode),
       year = Value(year),
       cachedAt = Value(cachedAt);
  static Insertable<HolidayTableData> custom({
    Expression<String>? apiId,
    Expression<DateTime>? date,
    Expression<String>? localName,
    Expression<String>? name,
    Expression<String>? countryCode,
    Expression<bool>? fixed,
    Expression<bool>? global,
    Expression<String>? counties,
    Expression<String>? types,
    Expression<int>? year,
    Expression<DateTime>? cachedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (apiId != null) 'api_id': apiId,
      if (date != null) 'date': date,
      if (localName != null) 'local_name': localName,
      if (name != null) 'name': name,
      if (countryCode != null) 'country_code': countryCode,
      if (fixed != null) 'fixed': fixed,
      if (global != null) 'global': global,
      if (counties != null) 'counties': counties,
      if (types != null) 'types': types,
      if (year != null) 'year': year,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HolidayTableCompanion copyWith({
    Value<String>? apiId,
    Value<DateTime>? date,
    Value<String>? localName,
    Value<String>? name,
    Value<String>? countryCode,
    Value<bool>? fixed,
    Value<bool>? global,
    Value<String?>? counties,
    Value<String?>? types,
    Value<int>? year,
    Value<DateTime>? cachedAt,
    Value<int>? rowid,
  }) {
    return HolidayTableCompanion(
      apiId: apiId ?? this.apiId,
      date: date ?? this.date,
      localName: localName ?? this.localName,
      name: name ?? this.name,
      countryCode: countryCode ?? this.countryCode,
      fixed: fixed ?? this.fixed,
      global: global ?? this.global,
      counties: counties ?? this.counties,
      types: types ?? this.types,
      year: year ?? this.year,
      cachedAt: cachedAt ?? this.cachedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (apiId.present) {
      map['api_id'] = Variable<String>(apiId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (localName.present) {
      map['local_name'] = Variable<String>(localName.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (countryCode.present) {
      map['country_code'] = Variable<String>(countryCode.value);
    }
    if (fixed.present) {
      map['fixed'] = Variable<bool>(fixed.value);
    }
    if (global.present) {
      map['global'] = Variable<bool>(global.value);
    }
    if (counties.present) {
      map['counties'] = Variable<String>(counties.value);
    }
    if (types.present) {
      map['types'] = Variable<String>(types.value);
    }
    if (year.present) {
      map['year'] = Variable<int>(year.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HolidayTableCompanion(')
          ..write('apiId: $apiId, ')
          ..write('date: $date, ')
          ..write('localName: $localName, ')
          ..write('name: $name, ')
          ..write('countryCode: $countryCode, ')
          ..write('fixed: $fixed, ')
          ..write('global: $global, ')
          ..write('counties: $counties, ')
          ..write('types: $types, ')
          ..write('year: $year, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SchoolHolidayTableTable extends SchoolHolidayTable
    with TableInfo<$SchoolHolidayTableTable, SchoolHolidayTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SchoolHolidayTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _apiIdMeta = const VerificationMeta('apiId');
  @override
  late final GeneratedColumn<String> apiId = GeneratedColumn<String>(
    'api_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
    'end_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _localNameMeta = const VerificationMeta(
    'localName',
  );
  @override
  late final GeneratedColumn<String> localName = GeneratedColumn<String>(
    'local_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subdivisionCodeMeta = const VerificationMeta(
    'subdivisionCode',
  );
  @override
  late final GeneratedColumn<String> subdivisionCode = GeneratedColumn<String>(
    'subdivision_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<int> year = GeneratedColumn<int>(
    'year',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cachedAtMeta = const VerificationMeta(
    'cachedAt',
  );
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
    'cached_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    apiId,
    startDate,
    endDate,
    localName,
    name,
    subdivisionCode,
    year,
    cachedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'school_holiday_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<SchoolHolidayTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('api_id')) {
      context.handle(
        _apiIdMeta,
        apiId.isAcceptableOrUnknown(data['api_id']!, _apiIdMeta),
      );
    } else if (isInserting) {
      context.missing(_apiIdMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    } else if (isInserting) {
      context.missing(_endDateMeta);
    }
    if (data.containsKey('local_name')) {
      context.handle(
        _localNameMeta,
        localName.isAcceptableOrUnknown(data['local_name']!, _localNameMeta),
      );
    } else if (isInserting) {
      context.missing(_localNameMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('subdivision_code')) {
      context.handle(
        _subdivisionCodeMeta,
        subdivisionCode.isAcceptableOrUnknown(
          data['subdivision_code']!,
          _subdivisionCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_subdivisionCodeMeta);
    }
    if (data.containsKey('year')) {
      context.handle(
        _yearMeta,
        year.isAcceptableOrUnknown(data['year']!, _yearMeta),
      );
    } else if (isInserting) {
      context.missing(_yearMeta);
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {apiId, year, subdivisionCode};
  @override
  SchoolHolidayTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SchoolHolidayTableData(
      apiId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}api_id'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      )!,
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_date'],
      )!,
      localName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_name'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      subdivisionCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subdivision_code'],
      )!,
      year: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}year'],
      )!,
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
    );
  }

  @override
  $SchoolHolidayTableTable createAlias(String alias) {
    return $SchoolHolidayTableTable(attachedDatabase, alias);
  }
}

class SchoolHolidayTableData extends DataClass
    implements Insertable<SchoolHolidayTableData> {
  final String apiId;
  final DateTime startDate;
  final DateTime endDate;
  final String localName;
  final String name;
  final String subdivisionCode;
  final int year;
  final DateTime cachedAt;
  const SchoolHolidayTableData({
    required this.apiId,
    required this.startDate,
    required this.endDate,
    required this.localName,
    required this.name,
    required this.subdivisionCode,
    required this.year,
    required this.cachedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['api_id'] = Variable<String>(apiId);
    map['start_date'] = Variable<DateTime>(startDate);
    map['end_date'] = Variable<DateTime>(endDate);
    map['local_name'] = Variable<String>(localName);
    map['name'] = Variable<String>(name);
    map['subdivision_code'] = Variable<String>(subdivisionCode);
    map['year'] = Variable<int>(year);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  SchoolHolidayTableCompanion toCompanion(bool nullToAbsent) {
    return SchoolHolidayTableCompanion(
      apiId: Value(apiId),
      startDate: Value(startDate),
      endDate: Value(endDate),
      localName: Value(localName),
      name: Value(name),
      subdivisionCode: Value(subdivisionCode),
      year: Value(year),
      cachedAt: Value(cachedAt),
    );
  }

  factory SchoolHolidayTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SchoolHolidayTableData(
      apiId: serializer.fromJson<String>(json['apiId']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime>(json['endDate']),
      localName: serializer.fromJson<String>(json['localName']),
      name: serializer.fromJson<String>(json['name']),
      subdivisionCode: serializer.fromJson<String>(json['subdivisionCode']),
      year: serializer.fromJson<int>(json['year']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'apiId': serializer.toJson<String>(apiId),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime>(endDate),
      'localName': serializer.toJson<String>(localName),
      'name': serializer.toJson<String>(name),
      'subdivisionCode': serializer.toJson<String>(subdivisionCode),
      'year': serializer.toJson<int>(year),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  SchoolHolidayTableData copyWith({
    String? apiId,
    DateTime? startDate,
    DateTime? endDate,
    String? localName,
    String? name,
    String? subdivisionCode,
    int? year,
    DateTime? cachedAt,
  }) => SchoolHolidayTableData(
    apiId: apiId ?? this.apiId,
    startDate: startDate ?? this.startDate,
    endDate: endDate ?? this.endDate,
    localName: localName ?? this.localName,
    name: name ?? this.name,
    subdivisionCode: subdivisionCode ?? this.subdivisionCode,
    year: year ?? this.year,
    cachedAt: cachedAt ?? this.cachedAt,
  );
  SchoolHolidayTableData copyWithCompanion(SchoolHolidayTableCompanion data) {
    return SchoolHolidayTableData(
      apiId: data.apiId.present ? data.apiId.value : this.apiId,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      localName: data.localName.present ? data.localName.value : this.localName,
      name: data.name.present ? data.name.value : this.name,
      subdivisionCode: data.subdivisionCode.present
          ? data.subdivisionCode.value
          : this.subdivisionCode,
      year: data.year.present ? data.year.value : this.year,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SchoolHolidayTableData(')
          ..write('apiId: $apiId, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('localName: $localName, ')
          ..write('name: $name, ')
          ..write('subdivisionCode: $subdivisionCode, ')
          ..write('year: $year, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    apiId,
    startDate,
    endDate,
    localName,
    name,
    subdivisionCode,
    year,
    cachedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SchoolHolidayTableData &&
          other.apiId == this.apiId &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.localName == this.localName &&
          other.name == this.name &&
          other.subdivisionCode == this.subdivisionCode &&
          other.year == this.year &&
          other.cachedAt == this.cachedAt);
}

class SchoolHolidayTableCompanion
    extends UpdateCompanion<SchoolHolidayTableData> {
  final Value<String> apiId;
  final Value<DateTime> startDate;
  final Value<DateTime> endDate;
  final Value<String> localName;
  final Value<String> name;
  final Value<String> subdivisionCode;
  final Value<int> year;
  final Value<DateTime> cachedAt;
  final Value<int> rowid;
  const SchoolHolidayTableCompanion({
    this.apiId = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.localName = const Value.absent(),
    this.name = const Value.absent(),
    this.subdivisionCode = const Value.absent(),
    this.year = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SchoolHolidayTableCompanion.insert({
    required String apiId,
    required DateTime startDate,
    required DateTime endDate,
    required String localName,
    required String name,
    required String subdivisionCode,
    required int year,
    required DateTime cachedAt,
    this.rowid = const Value.absent(),
  }) : apiId = Value(apiId),
       startDate = Value(startDate),
       endDate = Value(endDate),
       localName = Value(localName),
       name = Value(name),
       subdivisionCode = Value(subdivisionCode),
       year = Value(year),
       cachedAt = Value(cachedAt);
  static Insertable<SchoolHolidayTableData> custom({
    Expression<String>? apiId,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<String>? localName,
    Expression<String>? name,
    Expression<String>? subdivisionCode,
    Expression<int>? year,
    Expression<DateTime>? cachedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (apiId != null) 'api_id': apiId,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (localName != null) 'local_name': localName,
      if (name != null) 'name': name,
      if (subdivisionCode != null) 'subdivision_code': subdivisionCode,
      if (year != null) 'year': year,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SchoolHolidayTableCompanion copyWith({
    Value<String>? apiId,
    Value<DateTime>? startDate,
    Value<DateTime>? endDate,
    Value<String>? localName,
    Value<String>? name,
    Value<String>? subdivisionCode,
    Value<int>? year,
    Value<DateTime>? cachedAt,
    Value<int>? rowid,
  }) {
    return SchoolHolidayTableCompanion(
      apiId: apiId ?? this.apiId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      localName: localName ?? this.localName,
      name: name ?? this.name,
      subdivisionCode: subdivisionCode ?? this.subdivisionCode,
      year: year ?? this.year,
      cachedAt: cachedAt ?? this.cachedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (apiId.present) {
      map['api_id'] = Variable<String>(apiId.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (localName.present) {
      map['local_name'] = Variable<String>(localName.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (subdivisionCode.present) {
      map['subdivision_code'] = Variable<String>(subdivisionCode.value);
    }
    if (year.present) {
      map['year'] = Variable<int>(year.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SchoolHolidayTableCompanion(')
          ..write('apiId: $apiId, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('localName: $localName, ')
          ..write('name: $name, ')
          ..write('subdivisionCode: $subdivisionCode, ')
          ..write('year: $year, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $VacationTableTable extends VacationTable
    with TableInfo<$VacationTableTable, VacationTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VacationTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
    'end_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, title, startDate, endDate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vacation_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<VacationTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    } else if (isInserting) {
      context.missing(_endDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VacationTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VacationTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      )!,
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_date'],
      )!,
    );
  }

  @override
  $VacationTableTable createAlias(String alias) {
    return $VacationTableTable(attachedDatabase, alias);
  }
}

class VacationTableData extends DataClass
    implements Insertable<VacationTableData> {
  final int id;
  final String title;
  final DateTime startDate;
  final DateTime endDate;
  const VacationTableData({
    required this.id,
    required this.title,
    required this.startDate,
    required this.endDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['start_date'] = Variable<DateTime>(startDate);
    map['end_date'] = Variable<DateTime>(endDate);
    return map;
  }

  VacationTableCompanion toCompanion(bool nullToAbsent) {
    return VacationTableCompanion(
      id: Value(id),
      title: Value(title),
      startDate: Value(startDate),
      endDate: Value(endDate),
    );
  }

  factory VacationTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VacationTableData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime>(json['endDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime>(endDate),
    };
  }

  VacationTableData copyWith({
    int? id,
    String? title,
    DateTime? startDate,
    DateTime? endDate,
  }) => VacationTableData(
    id: id ?? this.id,
    title: title ?? this.title,
    startDate: startDate ?? this.startDate,
    endDate: endDate ?? this.endDate,
  );
  VacationTableData copyWithCompanion(VacationTableCompanion data) {
    return VacationTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VacationTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, startDate, endDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VacationTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate);
}

class VacationTableCompanion extends UpdateCompanion<VacationTableData> {
  final Value<int> id;
  final Value<String> title;
  final Value<DateTime> startDate;
  final Value<DateTime> endDate;
  const VacationTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
  });
  VacationTableCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required DateTime startDate,
    required DateTime endDate,
  }) : title = Value(title),
       startDate = Value(startDate),
       endDate = Value(endDate);
  static Insertable<VacationTableData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
    });
  }

  VacationTableCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<DateTime>? startDate,
    Value<DateTime>? endDate,
  }) {
    return VacationTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
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
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VacationTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $HolidayTableTable holidayTable = $HolidayTableTable(this);
  late final $SchoolHolidayTableTable schoolHolidayTable =
      $SchoolHolidayTableTable(this);
  late final $VacationTableTable vacationTable = $VacationTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    holidayTable,
    schoolHolidayTable,
    vacationTable,
  ];
}

typedef $$HolidayTableTableCreateCompanionBuilder =
    HolidayTableCompanion Function({
      required String apiId,
      required DateTime date,
      required String localName,
      required String name,
      required String countryCode,
      Value<bool> fixed,
      Value<bool> global,
      Value<String?> counties,
      Value<String?> types,
      required int year,
      required DateTime cachedAt,
      Value<int> rowid,
    });
typedef $$HolidayTableTableUpdateCompanionBuilder =
    HolidayTableCompanion Function({
      Value<String> apiId,
      Value<DateTime> date,
      Value<String> localName,
      Value<String> name,
      Value<String> countryCode,
      Value<bool> fixed,
      Value<bool> global,
      Value<String?> counties,
      Value<String?> types,
      Value<int> year,
      Value<DateTime> cachedAt,
      Value<int> rowid,
    });

class $$HolidayTableTableFilterComposer
    extends Composer<_$AppDatabase, $HolidayTableTable> {
  $$HolidayTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get apiId => $composableBuilder(
    column: $table.apiId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get localName => $composableBuilder(
    column: $table.localName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get countryCode => $composableBuilder(
    column: $table.countryCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get fixed => $composableBuilder(
    column: $table.fixed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get global => $composableBuilder(
    column: $table.global,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get counties => $composableBuilder(
    column: $table.counties,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get types => $composableBuilder(
    column: $table.types,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$HolidayTableTableOrderingComposer
    extends Composer<_$AppDatabase, $HolidayTableTable> {
  $$HolidayTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get apiId => $composableBuilder(
    column: $table.apiId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localName => $composableBuilder(
    column: $table.localName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get countryCode => $composableBuilder(
    column: $table.countryCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get fixed => $composableBuilder(
    column: $table.fixed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get global => $composableBuilder(
    column: $table.global,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get counties => $composableBuilder(
    column: $table.counties,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get types => $composableBuilder(
    column: $table.types,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$HolidayTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $HolidayTableTable> {
  $$HolidayTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get apiId =>
      $composableBuilder(column: $table.apiId, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get localName =>
      $composableBuilder(column: $table.localName, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get countryCode => $composableBuilder(
    column: $table.countryCode,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get fixed =>
      $composableBuilder(column: $table.fixed, builder: (column) => column);

  GeneratedColumn<bool> get global =>
      $composableBuilder(column: $table.global, builder: (column) => column);

  GeneratedColumn<String> get counties =>
      $composableBuilder(column: $table.counties, builder: (column) => column);

  GeneratedColumn<String> get types =>
      $composableBuilder(column: $table.types, builder: (column) => column);

  GeneratedColumn<int> get year =>
      $composableBuilder(column: $table.year, builder: (column) => column);

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$HolidayTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HolidayTableTable,
          HolidayTableData,
          $$HolidayTableTableFilterComposer,
          $$HolidayTableTableOrderingComposer,
          $$HolidayTableTableAnnotationComposer,
          $$HolidayTableTableCreateCompanionBuilder,
          $$HolidayTableTableUpdateCompanionBuilder,
          (
            HolidayTableData,
            BaseReferences<_$AppDatabase, $HolidayTableTable, HolidayTableData>,
          ),
          HolidayTableData,
          PrefetchHooks Function()
        > {
  $$HolidayTableTableTableManager(_$AppDatabase db, $HolidayTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HolidayTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HolidayTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HolidayTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> apiId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String> localName = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> countryCode = const Value.absent(),
                Value<bool> fixed = const Value.absent(),
                Value<bool> global = const Value.absent(),
                Value<String?> counties = const Value.absent(),
                Value<String?> types = const Value.absent(),
                Value<int> year = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HolidayTableCompanion(
                apiId: apiId,
                date: date,
                localName: localName,
                name: name,
                countryCode: countryCode,
                fixed: fixed,
                global: global,
                counties: counties,
                types: types,
                year: year,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String apiId,
                required DateTime date,
                required String localName,
                required String name,
                required String countryCode,
                Value<bool> fixed = const Value.absent(),
                Value<bool> global = const Value.absent(),
                Value<String?> counties = const Value.absent(),
                Value<String?> types = const Value.absent(),
                required int year,
                required DateTime cachedAt,
                Value<int> rowid = const Value.absent(),
              }) => HolidayTableCompanion.insert(
                apiId: apiId,
                date: date,
                localName: localName,
                name: name,
                countryCode: countryCode,
                fixed: fixed,
                global: global,
                counties: counties,
                types: types,
                year: year,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$HolidayTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HolidayTableTable,
      HolidayTableData,
      $$HolidayTableTableFilterComposer,
      $$HolidayTableTableOrderingComposer,
      $$HolidayTableTableAnnotationComposer,
      $$HolidayTableTableCreateCompanionBuilder,
      $$HolidayTableTableUpdateCompanionBuilder,
      (
        HolidayTableData,
        BaseReferences<_$AppDatabase, $HolidayTableTable, HolidayTableData>,
      ),
      HolidayTableData,
      PrefetchHooks Function()
    >;
typedef $$SchoolHolidayTableTableCreateCompanionBuilder =
    SchoolHolidayTableCompanion Function({
      required String apiId,
      required DateTime startDate,
      required DateTime endDate,
      required String localName,
      required String name,
      required String subdivisionCode,
      required int year,
      required DateTime cachedAt,
      Value<int> rowid,
    });
typedef $$SchoolHolidayTableTableUpdateCompanionBuilder =
    SchoolHolidayTableCompanion Function({
      Value<String> apiId,
      Value<DateTime> startDate,
      Value<DateTime> endDate,
      Value<String> localName,
      Value<String> name,
      Value<String> subdivisionCode,
      Value<int> year,
      Value<DateTime> cachedAt,
      Value<int> rowid,
    });

class $$SchoolHolidayTableTableFilterComposer
    extends Composer<_$AppDatabase, $SchoolHolidayTableTable> {
  $$SchoolHolidayTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get apiId => $composableBuilder(
    column: $table.apiId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get localName => $composableBuilder(
    column: $table.localName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get subdivisionCode => $composableBuilder(
    column: $table.subdivisionCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SchoolHolidayTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SchoolHolidayTableTable> {
  $$SchoolHolidayTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get apiId => $composableBuilder(
    column: $table.apiId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localName => $composableBuilder(
    column: $table.localName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subdivisionCode => $composableBuilder(
    column: $table.subdivisionCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SchoolHolidayTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SchoolHolidayTableTable> {
  $$SchoolHolidayTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get apiId =>
      $composableBuilder(column: $table.apiId, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<String> get localName =>
      $composableBuilder(column: $table.localName, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get subdivisionCode => $composableBuilder(
    column: $table.subdivisionCode,
    builder: (column) => column,
  );

  GeneratedColumn<int> get year =>
      $composableBuilder(column: $table.year, builder: (column) => column);

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$SchoolHolidayTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SchoolHolidayTableTable,
          SchoolHolidayTableData,
          $$SchoolHolidayTableTableFilterComposer,
          $$SchoolHolidayTableTableOrderingComposer,
          $$SchoolHolidayTableTableAnnotationComposer,
          $$SchoolHolidayTableTableCreateCompanionBuilder,
          $$SchoolHolidayTableTableUpdateCompanionBuilder,
          (
            SchoolHolidayTableData,
            BaseReferences<
              _$AppDatabase,
              $SchoolHolidayTableTable,
              SchoolHolidayTableData
            >,
          ),
          SchoolHolidayTableData,
          PrefetchHooks Function()
        > {
  $$SchoolHolidayTableTableTableManager(
    _$AppDatabase db,
    $SchoolHolidayTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SchoolHolidayTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SchoolHolidayTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SchoolHolidayTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> apiId = const Value.absent(),
                Value<DateTime> startDate = const Value.absent(),
                Value<DateTime> endDate = const Value.absent(),
                Value<String> localName = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> subdivisionCode = const Value.absent(),
                Value<int> year = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SchoolHolidayTableCompanion(
                apiId: apiId,
                startDate: startDate,
                endDate: endDate,
                localName: localName,
                name: name,
                subdivisionCode: subdivisionCode,
                year: year,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String apiId,
                required DateTime startDate,
                required DateTime endDate,
                required String localName,
                required String name,
                required String subdivisionCode,
                required int year,
                required DateTime cachedAt,
                Value<int> rowid = const Value.absent(),
              }) => SchoolHolidayTableCompanion.insert(
                apiId: apiId,
                startDate: startDate,
                endDate: endDate,
                localName: localName,
                name: name,
                subdivisionCode: subdivisionCode,
                year: year,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SchoolHolidayTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SchoolHolidayTableTable,
      SchoolHolidayTableData,
      $$SchoolHolidayTableTableFilterComposer,
      $$SchoolHolidayTableTableOrderingComposer,
      $$SchoolHolidayTableTableAnnotationComposer,
      $$SchoolHolidayTableTableCreateCompanionBuilder,
      $$SchoolHolidayTableTableUpdateCompanionBuilder,
      (
        SchoolHolidayTableData,
        BaseReferences<
          _$AppDatabase,
          $SchoolHolidayTableTable,
          SchoolHolidayTableData
        >,
      ),
      SchoolHolidayTableData,
      PrefetchHooks Function()
    >;
typedef $$VacationTableTableCreateCompanionBuilder =
    VacationTableCompanion Function({
      Value<int> id,
      required String title,
      required DateTime startDate,
      required DateTime endDate,
    });
typedef $$VacationTableTableUpdateCompanionBuilder =
    VacationTableCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<DateTime> startDate,
      Value<DateTime> endDate,
    });

class $$VacationTableTableFilterComposer
    extends Composer<_$AppDatabase, $VacationTableTable> {
  $$VacationTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );
}

class $$VacationTableTableOrderingComposer
    extends Composer<_$AppDatabase, $VacationTableTable> {
  $$VacationTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$VacationTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $VacationTableTable> {
  $$VacationTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);
}

class $$VacationTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VacationTableTable,
          VacationTableData,
          $$VacationTableTableFilterComposer,
          $$VacationTableTableOrderingComposer,
          $$VacationTableTableAnnotationComposer,
          $$VacationTableTableCreateCompanionBuilder,
          $$VacationTableTableUpdateCompanionBuilder,
          (
            VacationTableData,
            BaseReferences<
              _$AppDatabase,
              $VacationTableTable,
              VacationTableData
            >,
          ),
          VacationTableData,
          PrefetchHooks Function()
        > {
  $$VacationTableTableTableManager(_$AppDatabase db, $VacationTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VacationTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VacationTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VacationTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<DateTime> startDate = const Value.absent(),
                Value<DateTime> endDate = const Value.absent(),
              }) => VacationTableCompanion(
                id: id,
                title: title,
                startDate: startDate,
                endDate: endDate,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required DateTime startDate,
                required DateTime endDate,
              }) => VacationTableCompanion.insert(
                id: id,
                title: title,
                startDate: startDate,
                endDate: endDate,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$VacationTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VacationTableTable,
      VacationTableData,
      $$VacationTableTableFilterComposer,
      $$VacationTableTableOrderingComposer,
      $$VacationTableTableAnnotationComposer,
      $$VacationTableTableCreateCompanionBuilder,
      $$VacationTableTableUpdateCompanionBuilder,
      (
        VacationTableData,
        BaseReferences<_$AppDatabase, $VacationTableTable, VacationTableData>,
      ),
      VacationTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$HolidayTableTableTableManager get holidayTable =>
      $$HolidayTableTableTableManager(_db, _db.holidayTable);
  $$SchoolHolidayTableTableTableManager get schoolHolidayTable =>
      $$SchoolHolidayTableTableTableManager(_db, _db.schoolHolidayTable);
  $$VacationTableTableTableManager get vacationTable =>
      $$VacationTableTableTableManager(_db, _db.vacationTable);
}
