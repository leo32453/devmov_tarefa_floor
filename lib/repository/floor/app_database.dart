// imports needed for the floor classes
import 'dart:async';

import 'package:devmov_tarefa_floor/repository/floor/person.dart';
import 'package:devmov_tarefa_floor/repository/floor/person_dao.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [Person])
abstract class AppDatabase extends FloorDatabase {

  PersonDao get personDao;

}