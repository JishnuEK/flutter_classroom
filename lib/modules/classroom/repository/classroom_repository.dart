import 'package:dio/dio.dart';
import 'package:flutter_classroom/common/general.dart';
import 'package:flutter_classroom/modules/classroom/models/classroom_details_model.dart';
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

  Future<ApiResult<ClassroomDetailsModel>> getClassroomDetails(
      {required int id}) async {
    const fLabel = 'getClassroom';

    try {
      final response = await dioClient.get('${url.getClassroom}/$id');

      ClassroomDetailsModel data = ClassroomDetailsModel.fromJson(response);

      return ApiResult.success(data);
    } catch (e, s) {
      printLog(
          '$_MODULE_LABEL:$fLabel:${(NetworkExceptions.getDioException(e))}-$s',
          priority: LOG_LEVEL.ERROR);

      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<ClassroomDetailsModel>> saveSubjectToClass({
    required int id,
    required int subjectId,
  }) async {
    const fLabel = 'saveSubjectToClass';

    try {
      FormData formData = FormData.fromMap({
        "subject": subjectId,
      });
      final response =
          await dioClient.patch('${url.getClassroom}/$id', data: formData);

      ClassroomDetailsModel data = ClassroomDetailsModel.fromJson(response);

      return ApiResult.success(data);
    } catch (e, s) {
      printLog(
          '$_MODULE_LABEL:$fLabel:${(NetworkExceptions.getDioException(e))}-$s',
          priority: LOG_LEVEL.ERROR);

      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
}
