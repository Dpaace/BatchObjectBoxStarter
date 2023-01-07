import 'package:batch_student_starter/data_source/local_data_source/course_data_source.dart';
import 'package:batch_student_starter/model/course.dart';

abstract class CourseRepository {
  // Batch
  Future<List<Course>> getAllCourse();
  Future<int> addCourse(Course course);
  Future<Course?> getCourseByCourseName(String courseName);
}

class CourseRepositoryImpl extends CourseRepository {
  @override
  Future<int> addCourse(Course course) {
    return CourseDataSource().addCourse(course);
  }

  @override
  Future<List<Course>> getAllCourse() {
    return CourseDataSource().getAllCourse();
  }

  @override
  Future<Course?> getCourseByCourseName(String courseName) {
    return CourseDataSource().getCourseByCourseName(courseName);
  }
}
