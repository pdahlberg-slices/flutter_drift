import 'package:drift/web.dart';
import 'package:flutter_drift/persistence/drift_setup.dart';

SharedDatabase constructDb() => SharedDatabase(WebDatabase("db"));
