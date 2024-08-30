import 'package:flutter_classroom/common/constants.dart';
import 'package:flutter_classroom/modules/subjects/models/subjects_model.dart';
import 'package:flutter_classroom/modules/subjects/repository/subjects_repository.dart';
import 'package:flutter_classroom/routes/app_routes.dart';
import 'package:flutter_classroom/widgets/custom_alert.dart';
import 'package:get/get.dart';

import '../../../repository/repository_index.dart';

class SubjectController extends GetxController {
  @override
  void onInit() {
    getSubjects();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  SubjectRepository _repository = SubjectRepository();
  String get subjectWidget => 'subjectWidget';
  bool isLoading = true;
  List<Subject> list = [];

  Subject? selectedSubjects;

  navigatToDetails(Subject _data) {
    selectedSubjects = _data;
    Get.toNamed(Routes.SUBJECTDETAILS);
  }

  //API
  getSubjects() async {
    isLoading = (true);
    update([subjectWidget]);
    list.clear();
    ApiResult<SubjectsModel> apiResult = await _repository.getSubjects();

    apiResult.when(success: (SubjectsModel data) {
      if (data != null) {
        list.addAll(data.subjects);
      } else {
        CustomAlert.ErrorSnackbar(errorMessage);
      }
      isLoading = (false);
      update([subjectWidget]);
    }, failure: (NetworkExceptions error) {
      CustomAlert.ErrorSnackbar(NetworkExceptions.getErrorMessage(error));
      isLoading = (false);
      update([subjectWidget]);
    });
  }
}
