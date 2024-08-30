import 'package:flutter/material.dart';
import 'package:flutter_classroom/common/custom_size.dart';
import 'package:flutter_classroom/modules/classroom/controller/classroom_controller.dart';
import 'package:flutter_classroom/widgets/custom-card_widget.dart';
import 'package:flutter_classroom/widgets/custom_appbar.dart';
import 'package:flutter_classroom/widgets/custom_loading.dart';
import 'package:get/get.dart';

class ScreenClassroom extends StatelessWidget {
  const ScreenClassroom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appbar(context),
      body: Padding(
        padding: CustomSize.horizontalPaddingOnly,
        child: Column(
          children: [
            Text(
              'Classroom',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            customVerticalGap(15),
            Expanded(
              child: GetBuilder<ClassroomController>(
                  id: Get.find<ClassroomController>().classroomWidget,
                  builder: (controller) {
                    if (controller.isLoading) {
                      return CustomLoading.defaultLoading();
                    } else if (controller.classroomList.isEmpty) {
                      return const Center(
                        child: Text('No Classroom'),
                      );
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.classroomList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CustomCardWidget(
                            title: controller.classroomList[index].name,
                            content:
                                '${controller.classroomList[index].size} Seats',
                            subtitle: controller.classroomList[index].layout,
                            onClick: () {
                              controller.navigatToDetails(
                                  controller.classroomList[index]);
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
