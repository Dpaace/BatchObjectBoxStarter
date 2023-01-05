import 'package:batch_student_starter/model/student.dart';
import 'package:batch_student_starter/repository/batch_repo.dart';
import 'package:batch_student_starter/repository/course_repo.dart';
import 'package:batch_student_starter/repository/student_repo.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';

import '../model/batch.dart';
import '../model/course.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final List<Batch> _lstBatches = [];
  List<Course> _lstCourseSelected = [];
  String _dropDownValue = "";

  final _key = GlobalKey<FormState>();
  final _fnameController = TextEditingController(text: 'Kiran');
  final _lnameController = TextEditingController(text: 'Rana');
  final _usernameController = TextEditingController(text: 'kiran');
  final _passwordController = TextEditingController(text: 'kiran123');

  _saveStudent() async {
    Student student = Student(
      _fnameController.text,
      _lnameController.text,
      _usernameController.text,
      _passwordController.text,
    );

    //  Get the batch object from the list of batches
    final batch = _lstBatches
        .firstWhere((element) => element.batchName == _dropDownValue);

    student.batch.target = batch;
    // Insert all the course instance in Student Box
    for (Course c in _lstCourseSelected) {
      student.course.add(c);
    }

    int status = await StudentRepositoryImpl().addStudent(student);
    _showStudentCourse();
    _showMessage(status);
  }

  _showStudentCourse() async {
    List<Student> lstStudent = await StudentRepositoryImpl().getStudents();
    for (Student s in lstStudent) {
      debugPrint(s.fname);
      for (Course c in s.course) {
        debugPrint(c.courseName);
      }
    }
  }

  _showMessage(int status) {
    if (status > 0) {
      MotionToast.success(
        description: const Text(
          "Student Added Successfully",
        ),
      ).show(context);
    } else {
      MotionToast.error(
        description: const Text(
          "Error in Adding Student",
        ),
      ).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  TextFormField(
                    controller: _fnameController,
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter first name';
                      }
                      return null;
                    }),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _lnameController,
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter last name';
                      }
                      return null;
                    }),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  FutureBuilder(
                    future: BatchRepositoryImpl().getBatch(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return DropdownButtonFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select batch';
                            }
                            return null;
                          },
                          isExpanded: true,
                          decoration: const InputDecoration(
                            labelText: 'Select Batch',
                          ),
                          items: snapshot.data!
                              .map((batch) => DropdownMenuItem(
                                    value: batch.batchName,
                                    child: Text(batch.batchName),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            _dropDownValue = value!;
                          },
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                  FutureBuilder(
                    future: CourseRepositoryImpl().getCourse(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return MultiSelectDialogField(
                          items: snapshot.data!
                              .map((course) =>
                                  MultiSelectItem(course, course.courseName))
                              .toList(),
                          listType: MultiSelectListType.CHIP,
                          buttonText: const Text("Select Course"),
                          buttonIcon: const Icon(Icons.search),
                          onConfirm: (values) {
                            _lstCourseSelected = values;
                          },
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          validator: ((value) {
                            if (value == null || value.isEmpty) {
                              return "Please select Course";
                            }
                            return null;
                          }),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter username';
                      }
                      return null;
                    }),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    }),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          _saveStudent();
                        }
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Brand Bold",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
