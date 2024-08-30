import 'package:flutter/material.dart';
import 'package:flutter_classroom/common/custom_size.dart';
import 'package:flutter_classroom/modules/students/controller/student_controller.dart';
import 'package:flutter_classroom/widgets/custom-card_widget.dart';
import 'package:flutter_classroom/widgets/custom_appbar.dart';
import 'package:flutter_classroom/widgets/custom_loading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScreenStudents extends StatelessWidget {
  const ScreenStudents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appbar(context),
      body: Padding(
        padding: CustomSize.horizontalPaddingOnly,
        child: Column(
          children: [
            Text(
              'Students',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            customVerticalGap(15),
            Expanded(
              child: GetBuilder<StudentController>(
                  id: Get.find<StudentController>().studentWidget,
                  builder: (controller) {
                    if (controller.isLoading) {
                      return CustomLoading.defaultLoading();
                    } else if (controller.studentsList.isEmpty) {
                      return const Center(
                        child: Text('No Students'),
                      );
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.studentsList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CustomCardWidget(
                            title: controller.studentsList[index].name,
                            content:
                                'Age: ${controller.studentsList[index].age}',
                            subtitle: controller.studentsList[index].email,
                            onClick: () {
                              controller.navigatToDetails(
                                  controller.studentsList[index]);
                            },
                          );
                        },
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
