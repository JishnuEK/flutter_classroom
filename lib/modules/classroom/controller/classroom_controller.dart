import 'package:flutter_classroom/common/constants.dart';
import 'package:flutter_classroom/modules/classroom/models/classroom_details_model.dart';
import 'package:flutter_classroom/modules/classroom/models/classroom_model.dart';
import 'package:flutter_classroom/modules/classroom/repository/classroom_repository.dart';
import 'package:flutter_classroom/modules/subjects/models/subjects_model.dart';
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
//
  String get classroomDetailsWidget => 'classroomDetailsWidget';
  bool isDetailsLoading = true;
  ClassroomDetailsModel? classroomDetails;
  Classroom? selectedClassroom;
  Subject? selectedSubject;
  //FUNCTION
  navigatToDetails(Classroom _data) {
    selectedClassroom = _data;
    selectedSubject = null;
    getClassroomDetails(_data.id);
    update([classroomDetailsWidget]);
    Get.toNamed(Routes.CLASSROOM_DETAILS);
  }

  addSubject() {
    Get.toNamed(Routes.SUBJECT, arguments: true)!.then((val) {
      selectedSubject = val;
      update([classroomDetailsWidget]);
    });
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

  getClassroomDetails(id) async {
    isDetailsLoading = (true);
    classroomDetails = null;
    update([classroomDetailsWidget]);
    ApiResult<ClassroomDetailsModel> apiResult =
        await _repository.getClassroomDetails(id: id);
    apiResult.when(success: (ClassroomDetailsModel data) {
      if (data != null) {
        classroomDetails = (data);
      } else {
        CustomAlert.ErrorSnackbar(errorMessage);
      }
      isDetailsLoading = (false);
      update([classroomDetailsWidget]);
    }, failure: (NetworkExceptions error) {
      CustomAlert.ErrorSnackbar(NetworkExceptions.getErrorMessage(error));
      isDetailsLoading = (false);
      update([classroomDetailsWidget]);
    });
  }

  saveSubjectToClass(id, subjectId) async {
    isDetailsLoading = (true);
    classroomDetails = null;
    update([classroomDetailsWidget]);
    ApiResult<ClassroomDetailsModel> apiResult =
        await _repository.saveSubjectToClass(id: id, subjectId: subjectId);
    apiResult.when(success: (ClassroomDetailsModel data) {
      if (data != null) {
        CustomAlert.defaultSnackbar('Saved Successfully');
        Get.close(1);
      } else {
        CustomAlert.ErrorSnackbar(errorMessage);
      }
      isDetailsLoading = (false);
      update([classroomDetailsWidget]);
    }, failure: (NetworkExceptions error) {
      CustomAlert.ErrorSnackbar(NetworkExceptions.getErrorMessage(error));
      isDetailsLoading = (false);
      update([classroomDetailsWidget]);
    });
  }
}
