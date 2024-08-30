import 'package:flutter_classroom/common/general.dart';
import 'package:flutter_classroom/modules/subjects/models/subjects_model.dart';

import '../../../repository/repository_index.dart';

class SubjectRepository extends APIRepository {
  String _MODULE_LABEL = "[SubjectRepository]";

  Future<ApiResult<SubjectsModel>> getSubjects() async {
    const fLabel = 'getSubjects';

    try {
      final response = await dioClient.get(url.getSubjects);

      SubjectsModel data = SubjectsModel.fromJson(response);

      return ApiResult.success(data);
    } catch (e, s) {
      printLog(
          '$_MODULE_LABEL:$fLabel:${(NetworkExceptions.getDioException(e))}-$s',
          priority: LOG_LEVEL.ERROR);

      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
}
