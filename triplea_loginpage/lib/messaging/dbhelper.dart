import 'dart:io';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  Future initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "db_messaging.db");

    final exist = await databaseExists(path);

    if (exist) {
      print("db exists");
      await openDatabase(path);
    } else {
      print("creating a copy");

      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      ByteData data = await rootBundle.load(join("assets", "db_messaging.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(path).writeAsBytes(bytes, flush: true);

      print("db copied");
    }
    await openDatabase(path);
  }
}
