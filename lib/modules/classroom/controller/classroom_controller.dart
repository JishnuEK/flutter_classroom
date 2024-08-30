import 'package:flutter_classroom/common/constants.dart';
import 'package:flutter_classroom/modules/classroom/models/classroom_model.dart';
import 'package:flutter_classroom/modules/classroom/repository/classroom_repository.dart';
import 'package:flutter_classroom/routes/app_routes.dart';
import 'package:flutter_classroom/widgets/custom_alert.dart';
import 'package:get/get.dart';

import '../../../repository/repository_index.dart';

class ClassroomController extends GetxController {
  @override
  void onInit() {
    getClassroom();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  ClassroomRepository _repository = ClassroomRepository();
  String get classroomWidget => 'classroomWidget';
  bool isLoading = true;
  List<Classroom> classroomList = [];

  Classroom? selectedClassroom;

  navigatToDetails(Classroom _data) {
    // selectedClassroom = _data;
    // Get.toNamed(Routes.STUDENTS_DETAILS);
  }

  //API
  getClassroom() async {
    isLoading = (true);
    update([classroomWidget]);
    classroomList.clear();
    ApiResult<ClassroomModel> apiResult = await _repository.getClassroom();

    apiResult.when(success: (ClassroomModel data) {
      if (data != null) {
        classroomList.addAll(data.classrooms);
      } else {
        CustomAlert.ErrorSnackbar(errorMessage);
      }
      isLoading = (false);
      update([classroomWidget]);
    }, failure: (NetworkExceptions error) {
      CustomAlert.ErrorSnackbar(NetworkExceptions.getErrorMessage(error));
      isLoading = (false);
      update([classroomWidget]);
    });
  }
}
