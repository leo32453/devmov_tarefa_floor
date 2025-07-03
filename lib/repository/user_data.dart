class UserData {
  final String name;
  final String age;

  UserData({
    required this.name,
    required this.age
  });

  Map<String, dynamic> toJson() {
    return {
      'name' : name,
      'age' : age
    };
  }
}