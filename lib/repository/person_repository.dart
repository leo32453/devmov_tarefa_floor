
import 'floor/person.dart';
import 'floor/person_dao.dart';

class PersonRepository {

  final PersonDao personDao;

  PersonRepository(this.personDao);

  Future<void> insert(Person person) => personDao.insert(person);

  Stream<List<Person>> getAllInStream() => personDao.getAllInStream();
}