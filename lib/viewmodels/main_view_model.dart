import 'package:flutter/material.dart';

import '../repository/floor/person.dart';
import '../repository/person_repository.dart';
import '../repository/user_repository.dart';

class MainViewModel extends ChangeNotifier {

  final UserRepository userRepository;
  final PersonRepository personRepository;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  String? _customError;

  bool _isLoading = false;

  MainViewModel(this.userRepository, this.personRepository){
    initialize();
  }

  String? get customError => _customError;
  bool get isLoading => _isLoading;

  Future<void> addUser() async {
    print("Name: ${nameController.text}, age: ${ageController
        .text}");
    _isLoading = true;
    notifyListeners();

    final person = Person(
        name: nameController.text,
        age: ageController.text,
    );
    personRepository.insert(person);

    _isLoading = false;
    notifyListeners();
  }
  
  // bulding list
  List<Person> _persons = [];

  get persons => _persons;

  void initialize() async {
    personRepository.getAllInStream().listen((List<Person> tries) {
      _persons = tries;
      notifyListeners();
    });
  }
}