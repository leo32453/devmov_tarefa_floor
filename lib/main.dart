import 'package:devmov_tarefa_floor/repository/floor/app_database.dart';
import 'package:devmov_tarefa_floor/repository/person_repository.dart';
import 'package:devmov_tarefa_floor/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:devmov_tarefa_floor/ui/app.dart';
import 'package:devmov_tarefa_floor/viewmodels/main_view_model.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // init repositories
  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  final personRepository = PersonRepository(database.personDao);
  final userRepository = UserRepository();

  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => MainViewModel(userRepository, personRepository)),
        ],
        child: const App(),
      )
  );
}