// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_classroom/widgets/custom_details_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:flutter_classroom/common/custom_size.dart';
import 'package:flutter_classroom/modules/students/controller/student_controller.dart';
import 'package:flutter_classroom/widgets/custom_appbar.dart';

class ScreenStudentDetail extends StatelessWidget {
  const ScreenStudentDetail({Key? key}) : super(key: key);

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
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          customVerticalGap(15),
          Expanded(
            child: GetBuilder<StudentController>(
                id: Get.find<StudentController>().studentWidget,
                builder: (controller) {
                  if (controller.selectedStudent == null) {
                    return const Center(
                      child: Text('No Students'),
                    );
                  } else {
                    return DetailsWidget(
                      content: 'Age: ${controller.selectedStudent!.age}',
                      image:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLe5PABjXc17cjIMOibECLM7ppDwMmiDg6Dw&s',
                      subtitle: controller.selectedStudent!.email,
                      title: controller.selectedStudent!.name,
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
