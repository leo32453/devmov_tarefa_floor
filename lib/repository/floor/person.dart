
import 'package:floor/floor.dart';

@entity
class Person {
  @PrimaryKey(autoGenerate: true)
  int? id;

  final String name;

  final String age;

  Person({
    this.id,
    required this.name,
    required this.age
  });

  // @override
  // String toString() {
  //   return 'Person(id: $id, name: $name, age: $age)';
  // }
}