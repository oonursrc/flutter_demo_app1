import 'package:flutter/material.dart';
import 'package:flutter_demo_app1/models/student.dart';
import 'package:flutter_demo_app1/validation/student_validator.dart';

class StudentEdit extends StatefulWidget {

  Student selectedStudent;

  StudentEdit(Student selectedStudent) {
    this.selectedStudent = selectedStudent;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StudentEditState(selectedStudent);
  }
}

class _StudentEditState extends State with StudentVaidationMixin {
  Student selectedStudent;

  var formKey = GlobalKey<FormState>();

  _StudentEditState(Student selectedStudent) {
    this.selectedStudent = selectedStudent;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Öğrenci Güncelle"),
        ),
        body: Container(
          margin: EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                buildFirstNameField(),
                buildLastNameField(),
                buildGradeField(),
                buildSubmitButton()
              ],
            ),
          ),
        ));
  }

  Widget buildFirstNameField() {
    return TextFormField(
      initialValue:selectedStudent.firstName,
      decoration: InputDecoration(labelText: "Öğrenci Adı: ", hintText: "Onur"),
      validator: validateFirstName,
      onSaved: (String value) {
        selectedStudent.firstName = value;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      initialValue:selectedStudent.lastName,
      decoration:
      InputDecoration(labelText: "Öğrenci Soyadı: ", hintText: "Saraç"),
      validator: validateLastName,
      onSaved: (String value) {
        selectedStudent.lastName = value;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      initialValue:selectedStudent.grade.toString(),
      decoration: InputDecoration(labelText: "Öğrenci Notu: ", hintText: "85"),
      validator: validateGrade,
      onSaved: (String value) {
        selectedStudent.grade = int.parse(value);
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          saveStudent();
          Navigator.pop(context);
        }
      },
    );
  }

  void saveStudent() {
    print(selectedStudent.firstName + " güncellendi.");
  }
}
