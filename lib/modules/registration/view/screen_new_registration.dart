// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_classroom/modules/registration/widgets/registraion_card_widget.dart';
import 'package:flutter_classroom/modules/registration/widgets/selection_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:flutter_classroom/common/custom_size.dart';
import 'package:flutter_classroom/modules/registration/controller/register_controller.dart';
import 'package:flutter_classroom/widgets/custom_appbar.dart';
import 'package:flutter_classroom/widgets/custom_button.dart';
import 'package:flutter_classroom/widgets/custom_loading.dart';

class ScreenNewRegistration extends StatelessWidget {
  const ScreenNewRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appbar(context),
      body: Stack(
        children: [
          Padding(
            padding: CustomSize.horizontalPaddingOnly,
            child: Column(
              children: [
                Text(
                  'New Registration',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                customVerticalGap(15),
                GetBuilder<RegistrationController>(
                    id: Get.find<RegistrationController>().saveWidget,
                    builder: (controller) {
                      return RegisterSelectWidget(
                        type: REgisterClassType.subject,
                        isselected:
                            controller.selectedSubject == null ? false : true,
                        name: controller.selectedSubject == null
                            ? ''
                            : controller.selectedSubject!.name,
                        onselect: () {
                          controller.addSubject();
                        },
                      );
                    }),
                GetBuilder<RegistrationController>(
                    id: Get.find<RegistrationController>().saveWidget,
                    builder: (controller) {
                      return RegisterSelectWidget(
                        type: REgisterClassType.student,
                        isselected:
                            controller.selectedStudent == null ? false : true,
                        name: controller.selectedStudent == null
                            ? ''
                            : controller.selectedStudent!.name,
                        onselect: () {
                          controller.addStudent();
                        },
                      );
                    }),
                customVerticalGap(15),
                GetBuilder<RegistrationController>(
                    id: Get.find<RegistrationController>().saveWidget,
                    builder: (controller) {
                      return Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: CustomButton.textButton(
                              context,
                              title: 'New registration',
                              radius: 50,
                              onPressed: () {
                                controller.callSaveFunction();
                              },
                              color1: Color(0xffaac9bf),
                              color2: Color(0xff25af7f),
                            ),
                          ),
                        ],
                      );
                    }),
                customVerticalGap(15),
              ],
            ),
          ),
          GetBuilder<RegistrationController>(
              id: Get.find<RegistrationController>().saveWidget,
              builder: (controller) {
                return controller.submitLoading
                    ? CustomLoading.defaultLoadingBox()
                    : const SizedBox();
              }),
        ],
      ),
    );
  }
}
