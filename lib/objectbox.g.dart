// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'model/batch.dart';
import 'model/course.dart';
import 'model/student.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 7973567970471847443),
      name: 'Batch',
      lastPropertyId: const IdUid(2, 5565582980967360651),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 1733182465707414878),
            name: 'batchId',
            type: 6,
            flags: 129),
        ModelProperty(
            id: const IdUid(2, 5565582980967360651),
            name: 'batchName',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[
        ModelBacklink(name: 'student', srcEntity: 'Student', srcField: '')
      ]),
  ModelEntity(
      id: const IdUid(2, 957706331513307943),
      name: 'Student',
      lastPropertyId: const IdUid(6, 2158227698840239280),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 152870619231849788),
            name: 'stdId',
            type: 6,
            flags: 129),
        ModelProperty(
            id: const IdUid(2, 5274658200714910416),
            name: 'fname',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 1698644457425043243),
            name: 'lname',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 8522285081637613556),
            name: 'username',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 6982510719869846015),
            name: 'password',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 2158227698840239280),
            name: 'batchId',
            type: 11,
            flags: 520,
            indexId: const IdUid(1, 5581779810484595370),
            relationTarget: 'Batch')
      ],
      relations: <ModelRelation>[
        ModelRelation(
            id: const IdUid(1, 431842520111832531),
            name: 'course',
            targetId: const IdUid(5, 8790051710698032251))
      ],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(5, 8790051710698032251),
      name: 'Course',
      lastPropertyId: const IdUid(2, 6797617805164516190),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 2033593665299115438),
            name: 'courseID',
            type: 6,
            flags: 129),
        ModelProperty(
            id: const IdUid(2, 6797617805164516190),
            name: 'courseName',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[
        ModelBacklink(name: 'student', srcEntity: 'Student', srcField: '')
      ])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(5, 8790051710698032251),
      lastIndexId: const IdUid(2, 2162888841915197833),
      lastRelationId: const IdUid(1, 431842520111832531),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [7778431168385928969, 6761742370953814005],
      retiredIndexUids: const [],
      retiredPropertyUids: const [
        8184579944665031404,
        772430422153098228,
        1253276187506217607,
        1271814179181964512,
        8313065339329357965,
        5631414709302992175,
        5840172846191831483,
        2385507043962301451
      ],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Batch: EntityDefinition<Batch>(
        model: _entities[0],
        toOneRelations: (Batch object) => [],
        toManyRelations: (Batch object) => {
              RelInfo<Student>.toOneBacklink(6, object.batchId,
                  (Student srcObject) => srcObject.batch): object.student
            },
        getId: (Batch object) => object.batchId,
        setId: (Batch object, int id) {
          object.batchId = id;
        },
        objectToFB: (Batch object, fb.Builder fbb) {
          final batchNameOffset = fbb.writeString(object.batchName);
          fbb.startTable(3);
          fbb.addInt64(0, object.batchId);
          fbb.addOffset(1, batchNameOffset);
          fbb.finish(fbb.endTable());
          return object.batchId;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Batch(
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              batchId:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0));
          InternalToManyAccess.setRelInfo(
              object.student,
              store,
              RelInfo<Student>.toOneBacklink(
                  6, object.batchId, (Student srcObject) => srcObject.batch),
              store.box<Batch>());
          return object;
        }),
    Student: EntityDefinition<Student>(
        model: _entities[1],
        toOneRelations: (Student object) => [object.batch],
        toManyRelations: (Student object) =>
            {RelInfo<Student>.toMany(1, object.stdId): object.course},
        getId: (Student object) => object.stdId,
        setId: (Student object, int id) {
          object.stdId = id;
        },
        objectToFB: (Student object, fb.Builder fbb) {
          final fnameOffset = fbb.writeString(object.fname);
          final lnameOffset = fbb.writeString(object.lname);
          final usernameOffset = fbb.writeString(object.username);
          final passwordOffset = fbb.writeString(object.password);
          fbb.startTable(7);
          fbb.addInt64(0, object.stdId);
          fbb.addOffset(1, fnameOffset);
          fbb.addOffset(2, lnameOffset);
          fbb.addOffset(3, usernameOffset);
          fbb.addOffset(4, passwordOffset);
          fbb.addInt64(5, object.batch.targetId);
          fbb.finish(fbb.endTable());
          return object.stdId;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Student(
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, ''),
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 10, ''),
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 12, ''),
              stdId:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0));
          object.batch.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 14, 0);
          object.batch.attach(store);
          InternalToManyAccess.setRelInfo(object.course, store,
              RelInfo<Student>.toMany(1, object.stdId), store.box<Student>());
          return object;
        }),
    Course: EntityDefinition<Course>(
        model: _entities[2],
        toOneRelations: (Course object) => [],
        toManyRelations: (Course object) => {
              RelInfo<Student>.toManyBacklink(1, object.courseID):
                  object.student
            },
        getId: (Course object) => object.courseID,
        setId: (Course object, int id) {
          object.courseID = id;
        },
        objectToFB: (Course object, fb.Builder fbb) {
          final courseNameOffset = fbb.writeString(object.courseName);
          fbb.startTable(3);
          fbb.addInt64(0, object.courseID);
          fbb.addOffset(1, courseNameOffset);
          fbb.finish(fbb.endTable());
          return object.courseID;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Course(
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              courseID:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0));
          InternalToManyAccess.setRelInfo(
              object.student,
              store,
              RelInfo<Student>.toManyBacklink(1, object.courseID),
              store.box<Course>());
          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Batch] entity fields to define ObjectBox queries.
class Batch_ {
  /// see [Batch.batchId]
  static final batchId =
      QueryIntegerProperty<Batch>(_entities[0].properties[0]);

  /// see [Batch.batchName]
  static final batchName =
      QueryStringProperty<Batch>(_entities[0].properties[1]);
}

/// [Student] entity fields to define ObjectBox queries.
class Student_ {
  /// see [Student.stdId]
  static final stdId =
      QueryIntegerProperty<Student>(_entities[1].properties[0]);

  /// see [Student.fname]
  static final fname = QueryStringProperty<Student>(_entities[1].properties[1]);

  /// see [Student.lname]
  static final lname = QueryStringProperty<Student>(_entities[1].properties[2]);

  /// see [Student.username]
  static final username =
      QueryStringProperty<Student>(_entities[1].properties[3]);

  /// see [Student.password]
  static final password =
      QueryStringProperty<Student>(_entities[1].properties[4]);

  /// see [Student.batch]
  static final batch =
      QueryRelationToOne<Student, Batch>(_entities[1].properties[5]);

  /// see [Student.course]
  static final course =
      QueryRelationToMany<Student, Course>(_entities[1].relations[0]);
}

/// [Course] entity fields to define ObjectBox queries.
class Course_ {
  /// see [Course.courseID]
  static final courseID =
      QueryIntegerProperty<Course>(_entities[2].properties[0]);

  /// see [Course.courseName]
  static final courseName =
      QueryStringProperty<Course>(_entities[2].properties[1]);
}