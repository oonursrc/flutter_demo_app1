class StudentVaidationMixin{

  String validateFirstName(String value){
    if(value.length<2){
      return "İsim en az 2 karakter olmalıdır.";
    }
  }

  String validateLastName(String value){
    if(value.length<2){
      return "Soyadı en az 2 karakter olmalıdır.";
    }
  }

  String validateGrade(String value){
    var grade= int.parse(value);
    if (grade < 0 || grade >100){
      return "Not 0-100 arasında olmalıdır.";
    }
  }

}