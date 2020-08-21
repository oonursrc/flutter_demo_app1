class Student {
  int id;
  String firstName;
  String lastName;
  int grade;

  Student.withId(int id, String firstName, String lastName, int grade) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }

  Student(String firstName, String lastName, int grade) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }

  Student.withoutInfo(){
  }

  String get getFirstName {
    return this.firstName;
  }

  void set setFirstName(String valueFirstName) {
    this.firstName = valueFirstName;
  }

  String get getStatus {
    String message = "";

    if (this.grade >= 60) {
      message = "Geçti";
    } else if (this.grade >= 40) {
      message = "Bütünlemeye Kaldı";
    } else {
      message = "Kaldı";
    }
    return message;
  }
}
