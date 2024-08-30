import 'package:flutter_classroom/common/general.dart';
import 'package:flutter_classroom/modules/classroom/models/classroom_model.dart';

import '../../../repository/repository_index.dart';

class ClassroomRepository extends APIRepository {
  String _MODULE_LABEL = "[ClassroomRepository]";

  Future<ApiResult<ClassroomModel>> getClassroom() async {
    const fLabel = 'getClassroom';

    try {
      final response = await dioClient.get(url.getClassroom);

      ClassroomModel data = ClassroomModel.fromJson(response);

      return ApiResult.success(data);
    } catch (e, s) {
      printLog(
          '$_MODULE_LABEL:$fLabel:${(NetworkExceptions.getDioException(e))}-$s',
          priority: LOG_LEVEL.ERROR);

      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
}
