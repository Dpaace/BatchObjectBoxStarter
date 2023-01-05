import 'package:batch_student_starter/helper/objectbox.dart';
import 'package:batch_student_starter/model/course.dart';

import '../../state/objectbox_state.dart';

class CourseDataSource {
  ObjectBoxInstance get objectBoxInstace => ObjectBoxState.objectBoxInstance!;
  // OR
  // ObjectBoxInstance objectBoxInstance2 = ObjectBoxState.objectBoxInstance!;

  Future<int> addCourse(Course course) async {
    try {
      return objectBoxInstace.addCourse(course);
    } catch (e) {
      return Future.value(0);
    }
  }

  Future<List<Course>> getCourse() async {
    try {
      return objectBoxInstace.getAllCourses();
    } catch (e) {
      throw Exception("Error in getting all courses");
    }
  }
}
