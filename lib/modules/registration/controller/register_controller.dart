import 'package:flutter_classroom/common/models/form_validation_model.dart';
import 'package:flutter_classroom/modules/registration/models/register_delete_model.dart';
import 'package:flutter_classroom/modules/registration/models/register_post_model.dart';
import 'package:flutter_classroom/modules/registration/models/registration_model.dart';
import 'package:flutter_classroom/modules/registration/repository/register_repository.dart';
import 'package:flutter_classroom/modules/students/models/student_model.dart';
import 'package:flutter_classroom/modules/subjects/models/subjects_model.dart';
import 'package:flutter_classroom/routes/app_routes.dart';
import 'package:flutter_classroom/widgets/custom_alert.dart';
import 'package:get/get.dart';

import '../../../common/constants.dart';
import '../../../repository/repository_index.dart';

class RegistrationController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getRegistrationList();
  }

  @override
  void onClose() {
    super.onClose();
  }

  RegistrationRepository _repository = RegistrationRepository();
  String get ListWidget => 'ListWidget';
  bool isListLoading = true;
  List<Registration> registrationsList = [];
//

  String get saveWidget => 'saveWidget';
  bool submitLoading = false;
  RegistrationPostModel? registrationPostModel;

  //
  Subject? selectedSubject;
  Student? selectedStudent;
  //FUNCTION
  addSubject() {
    Get.toNamed(Routes.SUBJECT, arguments: true)!.then((val) {
      selectedSubject = val;
      update([saveWidget]);
    });
  }

  addStudent() {
    Get.toNamed(Routes.STUDENTS, arguments: true)!.then((val) {
      selectedStudent = val;
      update([saveWidget]);
    });
  }

  callSaveFunction() {
    FormValidation validation = saveValidation();
    if (validation.status == false) {
      CustomAlert.warningSnackbar(validation.message ?? "");
    } else {
      saveSubjectToClass();
    }
  }

  //API
  getRegistrationList() async {
    isListLoading = (true);
    update([ListWidget]);
    registrationsList.clear();
    ApiResult<RegistrationModel> apiResult =
        await _repository.getRegistrationList();
    apiResult.when(success: (RegistrationModel data) {
      if (data != null) {
        registrationsList.addAll(data.registrations);
      } else {
        CustomAlert.ErrorSnackbar(errorMessage);
      }
      isListLoading = (false);
      update([ListWidget]);
    }, failure: (NetworkExceptions error) {
      CustomAlert.ErrorSnackbar(NetworkExceptions.getErrorMessage(error));
      isListLoading = (false);
      update([ListWidget]);
    });
  }

  saveSubjectToClass() async {
    submitLoading = (true);
    update([saveWidget]);
    ApiResult<RegistrationPostModel> apiResult =
        await _repository.saveRegistration(
            student: selectedStudent!.id, subject: selectedSubject!.id);
    apiResult.when(success: (RegistrationPostModel data) {
      if (data != null) {
        if (data.registration != null) {
          CustomAlert.defaultSnackbar('Saved Successfully');
          Get.close(1);
          getRegistrationList();
        } else {
          CustomAlert.ErrorSnackbar(data.error);
        }
      } else {
        CustomAlert.ErrorSnackbar(errorMessage);
      }
      submitLoading = (false);
      update([saveWidget]);
    }, failure: (NetworkExceptions error) {
      CustomAlert.ErrorSnackbar(NetworkExceptions.getErrorMessage(error));
      submitLoading = (false);
      update([saveWidget]);
    });
  }

  delete(id) async {
    isListLoading = (true);
    update([ListWidget]);
    ApiResult<RegistrationDeleteModel> apiResult =
        await _repository.delete(id: id);
    apiResult.when(success: (RegistrationDeleteModel data) {
      if (data != null) {
        CustomAlert.defaultSnackbar('Deleted Successfully');

        getRegistrationList();
      } else {
        CustomAlert.ErrorSnackbar(errorMessage);
        isListLoading = (false);
      }
      update([ListWidget]);
    }, failure: (NetworkExceptions error) {
      CustomAlert.ErrorSnackbar(NetworkExceptions.getErrorMessage(error));
      isListLoading = (false);
      update([ListWidget]);
    });
  }

  //VALIDATION
  FormValidation saveValidation() {
    FormValidation res =
        FormValidation(true, "Successfully validated all fields");

    if (selectedSubject == null) {
      res.status = false;
      res.message = "Select Subject";
      return res;
    }
    if (selectedStudent == null) {
      res.status = false;
      res.message = "Select Student";
      return res;
    }
    return res;
  }
}
