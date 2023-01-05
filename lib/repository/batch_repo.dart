import 'package:batch_student_starter/model/batch.dart';

import '../data_source/local_data_source/batch_data_source.dart';

abstract class BatchRepository {
  // Batch
  Future<List<Batch>> getBatch();
  Future<int> addBatch(Batch batch);
}

class BatchRepositoryImpl extends BatchRepository {
  @override
  Future<int> addBatch(Batch batch) {
    return BatchDataSource().addBatch(batch);
  }

  @override
  Future<List<Batch>> getBatch() {
    return BatchDataSource().getBatch();
  }
}
