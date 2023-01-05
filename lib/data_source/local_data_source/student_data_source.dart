import 'package:batch_student_starter/helper/objectbox.dart';
import 'package:batch_student_starter/model/batch.dart';

import '../../model/student.dart';
import '../../state/objectbox_state.dart';

class StudentDataSource {
  ObjectBoxInstance get objectBoxInstace => ObjectBoxState.objectBoxInstance!;
  // OR
  // ObjectBoxInstance objectBoxInstance2 = ObjectBoxState.objectBoxInstance!;

  Future<int> addStudent(Student student) async {
    try {
      return objectBoxInstace.addStudent(student);
    } catch (e) {
      return Future.value(0);
      // return 0;
    }
  }

  Future<List<Student>> getStudents() async {
    try {
      return objectBoxInstace.getAllStudent();
    } catch (e) {
      throw Exception("Error in getting all student");
      // return 0;
    }
  }

  Future<int> addBatch(Batch batch) async {
    try {
      return objectBoxInstace.addBatch(batch);
    } catch (e) {
      return Future.value(0); 
    }
  }

  Future<List<Batch>> getBatch() async {
    try {
      return objectBoxInstace.getAllBatch();
    } catch (e) {
      throw Exception("Error in getting all batch");
    }
  }
}
