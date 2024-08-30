import 'package:flutter/material.dart';
import 'package:flutter_classroom/modules/subjects/controller/subjects_controller.dart';
import 'package:flutter_classroom/widgets/custom_appbar.dart';

import 'package:flutter_classroom/widgets/custom_details_widget.dart';
import 'package:get/get.dart';

import 'package:flutter_classroom/common/custom_size.dart';

class ScreenSubjectDetail extends StatelessWidget {
  const ScreenSubjectDetail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appbar(context),
      body: Column(
        children: [
          Text(
            'Student Details',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          customVerticalGap(15),
          Expanded(
            child: GetBuilder<SubjectController>(
                id: Get.find<SubjectController>().subjectWidget,
                builder: (controller) {
                  if (controller.selectedSubjects == null) {
                    return const Center(
                      child: Text('No Students'),
                    );
                  } else {
                    return DetailsWidget(
                      content:
                          'Credit: ${controller.selectedSubjects!.credits}',
                      image:
                          'https://cdn.shopify.com/s/files/1/0565/4039/7655/files/book_cover_1.png',
                      subtitle: controller.selectedSubjects!.teacher,
                      title: controller.selectedSubjects!.name,
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
