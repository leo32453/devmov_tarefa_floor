
import 'package:devmov_tarefa_floor/repository/floor/person.dart';
import 'package:floor/floor.dart';

@dao
abstract class PersonDao {

  @Insert(onConflict: OnConflictStrategy.abort)
  Future<void> insert(Person person);

  @Query('SELECT * FROM Person ORDER BY id DESC')
  Stream<List<Person>> getAllInStream();

}