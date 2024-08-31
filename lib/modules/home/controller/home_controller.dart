import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  String get ListWidget => 'ListWidget';
  bool showGrid = true;

  toogle() {
    showGrid = !showGrid;
    update([ListWidget]);
  }
}
