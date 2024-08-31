// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_classroom/modules/registration/widgets/registraion_card_widget.dart';
import 'package:flutter_classroom/routes/app_routes.dart';
import 'package:flutter_classroom/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:flutter_classroom/common/custom_size.dart';
import 'package:flutter_classroom/modules/registration/controller/register_controller.dart';
import 'package:flutter_classroom/widgets/custom_appbar.dart';
import 'package:flutter_classroom/widgets/custom_loading.dart';

class ScreenRegistrationList extends StatelessWidget {
  const ScreenRegistrationList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appbar(context),
      body: Padding(
        padding: CustomSize.horizontalPaddingOnly,
        child: Column(
          children: [
            Text(
              'Registration',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            customVerticalGap(15),
            Expanded(
              child: GetBuilder<RegistrationController>(
                  id: Get.find<RegistrationController>().ListWidget,
                  builder: (controller) {
                    if (controller.isListLoading) {
                      return CustomLoading.defaultLoading();
                    } else if (controller.registrationsList.isEmpty) {
                      return const Center(
                        child: Text('No Data'),
                      );
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.registrationsList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return RegistrationCardWidet(
                            id: controller.registrationsList[index].id
                                .toString(),
                            onDelete: () {
                              controller.delete(
                                  controller.registrationsList[index].id);
                            },
                          );
                        },
                      );
                    }
                  }),
            ),
            customVerticalGap(15),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: CustomButton.textButton(
                    context,
                    title: 'New registration',
                    radius: 50,
                    onPressed: () {
                      Get.toNamed(Routes.NEW_REGISTRATION);
                    },
                    color1: Color(0xffd9ebff),
                    color2: Color(0xff007aff),
                  ),
                ),
              ],
            ),
            customVerticalGap(15),
          ],
        ),
      ),
    );
  }
}
