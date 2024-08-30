import 'package:flutter_classroom/modules/subjects/controller/subjects_controller.dart';
import 'package:get/get.dart';

class SubjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SubjectController());
  }
}
