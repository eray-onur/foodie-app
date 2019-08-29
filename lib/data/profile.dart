class Profile {
  String userName = "jdoe22";
  String name = "Jane";
  String lastName = "Doe";
  DateTime joinedIn = DateTime.now();
  int age = 22;
  double budget = 50.0;
  String get getName => this.name;
  String get getUsername => this.userName;
  String get getLastName => this.lastName;
  DateTime get getJoinDate => this.joinedIn;
  int get getAge => this.age;
  double get getBudget => this.budget;
  Profile({this.userName, this.name, this.lastName, this.joinedIn, this.age, this.budget});
}