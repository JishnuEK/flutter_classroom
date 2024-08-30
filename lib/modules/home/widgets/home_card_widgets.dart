import 'package:flutter/material.dart';
import 'package:flutter_classroom/common/custom_size.dart';
import 'package:get/get.dart';

class HomeCardBuild extends StatelessWidget {
  const HomeCardBuild(
      {super.key,
      required this.icon,
      required this.name,
      required this.color,
      required this.onClick});

  final String name;
  final String icon;
  final Color color;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: (color),
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      child: InkWell(
        onTap: () {
          onClick();
        },
        child: SizedBox(
          width: Get.size.width / 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              customVerticalGap(15),
              Expanded(
                flex: 3,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox(
                        height: 85,
                        width: 85,
                        child: Image.asset(
                          icon,
                        ))),
              ),
              customVerticalGap(5),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        name,
                        style: Get.textTheme.bodySmall!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                        maxLines: 2,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
