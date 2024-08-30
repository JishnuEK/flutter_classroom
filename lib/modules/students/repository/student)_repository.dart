import 'package:flutter_classroom/common/general.dart';
import 'package:flutter_classroom/modules/students/models/student_model.dart';

import '../../../repository/repository_index.dart';

class StudentsRepository extends APIRepository {
  String _MODULE_LABEL = "[StudentsRepository]";

  Future<ApiResult<StudentModel>> getStudents() async {
    const fLabel = 'getStudents';

    try {
      final response = await dioClient.get(url.getStudents);

      StudentModel data = StudentModel.fromJson(response);

      return ApiResult.success(data);
    } catch (e, s) {
      printLog(
          '$_MODULE_LABEL:$fLabel:${(NetworkExceptions.getDioException(e))}-$s',
          priority: LOG_LEVEL.ERROR);

      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
}
