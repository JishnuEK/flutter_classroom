import 'package:flutter_classroom/modules/classroom/controller/classroom_controller.dart';
import 'package:get/get.dart';

class ClassroomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ClassroomController());
  }
}
