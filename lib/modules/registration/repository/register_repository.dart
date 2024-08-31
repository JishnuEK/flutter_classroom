import 'package:dio/dio.dart';
import 'package:flutter_classroom/common/general.dart';
import 'package:flutter_classroom/modules/registration/models/register_delete_model.dart';
import 'package:flutter_classroom/modules/registration/models/register_post_model.dart';
import 'package:flutter_classroom/modules/registration/models/registration_model.dart';

import '../../../repository/repository_index.dart';

class RegistrationRepository extends APIRepository {
  String _MODULE_LABEL = "[RegistrationRepository]";

  Future<ApiResult<RegistrationModel>> getRegistrationList() async {
    const fLabel = 'getRegistrationList';

    try {
      final response = await dioClient.get(url.getRegistration);

      RegistrationModel data = RegistrationModel.fromJson(response);

      return ApiResult.success(data);
    } catch (e, s) {
      printLog(
          '$_MODULE_LABEL:$fLabel:${(NetworkExceptions.getDioException(e))}-$s',
          priority: LOG_LEVEL.ERROR);

      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<RegistrationPostModel>> saveRegistration({
    required int student,
    required int subject,
  }) async {
    const fLabel = 'saveRegistration';

    printLog(student);
    printLog(subject);
    try {
      FormData formData =
          FormData.fromMap({"student": student, 'subject': subject});
      final response =
          await dioClient.post(url.getRegistration, data: formData);

      RegistrationPostModel data = RegistrationPostModel.fromJson(response);

      return ApiResult.success(data);
    } catch (e, s) {
      printLog(
          '$_MODULE_LABEL:$fLabel:${(NetworkExceptions.getDioException(e))}-$s',
          priority: LOG_LEVEL.ERROR);

      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<RegistrationDeleteModel>> delete({
    required int id,
  }) async {
    const fLabel = 'delete';

    try {
      final response = await dioClient.delete('${url.getRegistration}/$id');

      RegistrationDeleteModel data = RegistrationDeleteModel.fromJson(response);

      return ApiResult.success(data);
    } catch (e, s) {
      printLog(
          '$_MODULE_LABEL:$fLabel:${(NetworkExceptions.getDioException(e))}-$s',
          priority: LOG_LEVEL.ERROR);

      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
}
