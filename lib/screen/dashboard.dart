import 'package:batch_student_starter/app/theme.dart';
import 'package:batch_student_starter/data_source/local_data_source/batch_data_source.dart';
import 'package:batch_student_starter/data_source/local_data_source/course_data_source.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Text(
              "Batches",
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 300,
              child: FutureBuilder(
                future: BatchDataSource().getBatch(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.count(
                      childAspectRatio: 3 / 2,
                      crossAxisCount: 2,
                      children: [
                        // Get data from snapshot
                        for (var batch in snapshot.data!)
                          InkWell(
                            splashColor: Colors.red,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                "/",
                                arguments: batch.batchName,
                              );
                            },
                            child: Card(
                              color: HexColor.fromHex("#ED9728"),
                              child: Center(
                                child: Text(
                                  batch.batchName,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            const Text(
              "Courses",
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 300,
              child: FutureBuilder(
                future: CourseDataSource().getAllCourse(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.count(
                      childAspectRatio: 3 / 2,
                      crossAxisCount: 2,
                      children: [
                        // Get data from snapshot
                        for (var course in snapshot.data!)
                          InkWell(
                            splashColor: Colors.red,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                "/",
                                arguments: course.courseName,
                              );
                            },
                            child: Card(
                              color: HexColor.fromHex("#ED9728"),
                              child: Center(
                                child: Text(
                                  course.courseName,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
