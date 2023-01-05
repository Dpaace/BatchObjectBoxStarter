import 'package:batch_student_starter/state/objectbox_state.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';
import 'helper/objectbox.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Create an Object for ObjectBoxInstance
  ObjectBoxState.objectBoxInstance = await ObjectBoxInstance.init();
  runApp(
    const MyApp(),
  );
}
