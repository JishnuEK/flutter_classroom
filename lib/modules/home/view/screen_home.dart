import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_classroom/common/constants.dart';
import 'package:flutter_classroom/common/custom_size.dart';
import 'package:flutter_classroom/modules/home/controller/home_controller.dart';
import 'package:flutter_classroom/modules/home/widgets/home_card_widgets.dart';
import 'package:flutter_classroom/routes/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: CustomSize.horizontalPaddingOnly,
          child: Column(
            children: [
              customVerticalGap(15),
              Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.sp),
                            ),
                            Text(
                              'Good Morning',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18.sp),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      GetBuilder<HomeController>(
                          id: Get.find<HomeController>().ListWidget,
                          builder: (controller) {
                            return GestureDetector(
                                onTap: () {
                                  controller.toogle();
                                },
                                child:
                                    Image.asset(controller.showGrid ? g2 : g1));
                          })
                    ],
                  )),
              customVerticalGap(15),
              Expanded(
                  flex: 8,
                  child: GetBuilder<HomeController>(
                      id: Get.find<HomeController>().ListWidget,
                      builder: (controller) {
                        return GridView(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: controller.showGrid
                                      ? MediaQuery.sizeOf(context).height / 5
                                      : MediaQuery.sizeOf(context).height / 10,
                                  crossAxisCount: controller.showGrid ? 2 : 1,
                                  crossAxisSpacing: 5,
                                  childAspectRatio: 0.8,
                                  mainAxisSpacing: 5.0),
                          children: [
                            HomeCardBuild(
                              showIcon: controller.showGrid,
                              name: 'Students',
                              icon: h1,
                              onClick: () {
                                Get.toNamed(Routes.STUDENTS);
                              },
                              color: const Color(0xffaac9bf),
                            ),
                            HomeCardBuild(
                              showIcon: controller.showGrid,
                              name: 'Subjects',
                              icon: h2,
                              onClick: () {
                                Get.toNamed(Routes.SUBJECT);
                              },
                              color: const Color(0xffd9ebfd),
                            ),
                            HomeCardBuild(
                              showIcon: controller.showGrid,
                              name: 'Class Rooms',
                              icon: h3,
                              onClick: () {
                                Get.toNamed(Routes.CLASSROOM);
                              },
                              color: const Color(0xffffe0dd),
                            ),
                            HomeCardBuild(
                              showIcon: controller.showGrid,
                              name: 'Registration',
                              icon: h4,
                              onClick: () {
                                Get.toNamed(Routes.REGISTRATION_LIST);
                              },
                              color: const Color(0xfffff3d9),
                            )
                          ],
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
