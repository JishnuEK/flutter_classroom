import 'package:flutter_classroom/modules/students/controller/student_controller.dart';
import 'package:get/get.dart';

class StudentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StudentController());
  }
}
