import 'package:flutter_classroom/common/constants.dart';
import 'package:flutter_classroom/modules/students/models/student_model.dart';
import 'package:flutter_classroom/modules/students/repository/student)_repository.dart';
import 'package:flutter_classroom/repository/repository_index.dart';
import 'package:flutter_classroom/routes/app_routes.dart';
import 'package:flutter_classroom/widgets/custom_alert.dart';
import 'package:get/get.dart';

class StudentController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getStudents();
  }

  @override
  void onClose() {
    super.onClose();
  }

  StudentsRepository _studentsRepository = StudentsRepository();
  String get studentWidget => 'studentWidget';
  bool isLoading = true;
  List<Student> studentsList = [];

  Student? selectedStudent;

  navigatToDetails(Student _student) {
    selectedStudent = _student;
    Get.toNamed(Routes.STUDENTS_DETAILS);
  }

  //API
  getStudents() async {
    isLoading = (true);
    update([studentWidget]);
    studentsList.clear();
    ApiResult<StudentModel> apiResult = await _studentsRepository.getStudents();

    apiResult.when(success: (StudentModel data) {
      if (data != null) {
        studentsList.addAll(data.students);
      } else {
        CustomAlert.ErrorSnackbar(errorMessage);
      }
      isLoading = (false);
      update([studentWidget]);
    }, failure: (NetworkExceptions error) {
      CustomAlert.ErrorSnackbar(NetworkExceptions.getErrorMessage(error));
      isLoading = (false);
      update([studentWidget]);
    });
  }
}
