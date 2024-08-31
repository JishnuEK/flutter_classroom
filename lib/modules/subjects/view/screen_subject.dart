import 'package:flutter/material.dart';
import 'package:flutter_classroom/common/custom_size.dart';
import 'package:flutter_classroom/modules/subjects/controller/subjects_controller.dart';
import 'package:flutter_classroom/widgets/custom-card_widget.dart';
import 'package:flutter_classroom/widgets/custom_appbar.dart';
import 'package:flutter_classroom/widgets/custom_loading.dart';
import 'package:get/get.dart';

class ScreenSubject extends StatelessWidget {
  const ScreenSubject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appbar(context),
      body: Padding(
        padding: CustomSize.horizontalPaddingOnly,
        child: Column(
          children: [
            GetBuilder<SubjectController>(
                id: Get.find<SubjectController>().subjectWidget,
                builder: (controller) {
                  return Text(
                    controller.fromClassroom ? 'Add Subject' : 'Subjects',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  );
                }),
            customVerticalGap(15),
            Expanded(
              child: GetBuilder<SubjectController>(
                  id: Get.find<SubjectController>().subjectWidget,
                  builder: (controller) {
                    if (controller.isLoading) {
                      return CustomLoading.defaultLoading();
                    } else if (controller.list.isEmpty) {
                      return const Center(
                        child: Text('No Students'),
                      );
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.list.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CustomCardWidget(
                            title: controller.list[index].name,
                            content:
                                '${controller.list[index].credits} Credits',
                            subtitle: controller.list[index].teacher,
                            onClick: () {
                              controller
                                  .navigatToDetails(controller.list[index]);
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
