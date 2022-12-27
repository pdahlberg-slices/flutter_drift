
import 'package:drift/drift.dart';
import 'unsupported.dart'
  if (dart.library.html) 'drift_web.dart'
  if (dart.library.ffi) 'drift_native.dart';

part 'drift_setup.g.dart';

class Entity extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 6, max: 32)();
}

@DriftDatabase(tables: [Entity])
class SharedDatabase extends _$SharedDatabase {
  SharedDatabase(QueryExecutor qe) : super(qe);

  int get schemaVersion => 1;

}


