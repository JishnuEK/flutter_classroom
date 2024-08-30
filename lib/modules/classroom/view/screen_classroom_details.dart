// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:flutter_classroom/common/constants.dart';
import 'package:flutter_classroom/common/custom_size.dart';
import 'package:flutter_classroom/modules/classroom/controller/classroom_controller.dart';
import 'package:flutter_classroom/modules/classroom/widgets/classroom_card_widget.dart';
import 'package:flutter_classroom/widgets/custom_appbar.dart';
import 'package:flutter_classroom/widgets/custom_button.dart';
import 'package:flutter_classroom/widgets/custom_loading.dart';

class ScreenClassroomDetails extends StatelessWidget {
  const ScreenClassroomDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.appbar(context),
        body: Padding(
          padding: CustomSize.horizontalPaddingOnly,
          child: GetBuilder<ClassroomController>(
              id: Get.find<ClassroomController>().classroomDetailsWidget,
              builder: (controller) {
                if (controller.isDetailsLoading) {
                  return CustomLoading.defaultLoading();
                } else if (controller.classroomDetails == null) {
                  return const Center(
                    child: Text('No Data'),
                  );
                } else {
                  return Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            controller.classroomDetails!.name,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    customVerticalGap(15),
                    classroomCard(
                      isselected:
                          controller.selectedSubject == null ? false : true,
                      subjectName: controller.selectedSubject == null
                          ? ''
                          : controller.selectedSubject!.name,
                      teacher: controller.selectedSubject == null
                          ? ''
                          : controller.selectedSubject!.teacher,
                      onselect: () {
                        controller.addSubject();
                      },
                    ),
                    customVerticalGap(15),
                    Expanded(
                      child: controller.selectedClassroom!.layout == 'classroom'
                          ? classroomSeatArrange2(
                              seats: controller.selectedClassroom!.size,
                            )
                          : classroomSeatArrange(
                              seats: controller.selectedClassroom!.size,
                            ),
                    ),
                    customVerticalGap(15),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: CustomButton.textButton(
                            context,
                            title: 'Update Subject',
                            radius: 50,
                            onPressed: () {
                              if (controller.selectedSubject != null) {
                                controller.saveSubjectToClass(
                                    controller.selectedClassroom!.id,
                                    controller.selectedSubject!.id);
                              }
                            },
                            color1: Color(0xffaac9bf),
                            color2: Color(0xff25af7f),
                          ),
                        ),
                      ],
                    ),
                    customVerticalGap(15),
                  ]);
                }
              }),
        ));
  }
}
