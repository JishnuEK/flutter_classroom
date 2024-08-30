import 'package:flutter/material.dart';
import 'package:flutter_classroom/common/custom_size.dart';
import 'package:flutter_classroom/modules/students/controller/student_controller.dart';
import 'package:flutter_classroom/widgets/custom_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
                .titleMedium!
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
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 3, color: Colors.white)),
                              height: 100.h,
                              width: 100.h,
                              child: ClipOval(
                                child: Image.network(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLe5PABjXc17cjIMOibECLM7ppDwMmiDg6Dw&s',
                                  fit: BoxFit.contain,
                                ),
                              )),
                        ),
                        customVerticalGap(15),
                        Text(controller.selectedStudent!.name,
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.normal)),
                        Text('Age: ${controller.selectedStudent!.age}',
                            style: TextStyle(fontSize: 14.sp)),
                        Text(controller.selectedStudent!.email,
                            style: TextStyle(fontSize: 14.sp)),
                      ],
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
