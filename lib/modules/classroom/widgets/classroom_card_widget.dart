// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_classroom/common/constants.dart';
import 'package:flutter_classroom/common/custom_size.dart';
import 'package:flutter_classroom/widgets/custom_button.dart';

class classroomCard extends StatelessWidget {
  const classroomCard({
    Key? key,
    required this.isselected,
    this.subjectName = '',
    this.teacher = '',
    required this.onselect,
  }) : super(key: key);
  final bool isselected;
  final String subjectName;
  final String teacher;
  final Function onselect;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              )),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(isselected ? subjectName : 'Add Subject',
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.normal)),
                    isselected
                        ? Text(teacher,
                            style: TextStyle(
                                fontSize: 13.sp, fontWeight: FontWeight.normal))
                        : const SizedBox(),
                  ],
                ),
              ),
              customHorizontalGap(15),
              Expanded(
                flex: 3,
                child: CustomButton.textButton(
                  context,
                  title: isselected ? 'Change' : 'Add',
                  radius: 50,
                  onPressed: () {
                    onselect();
                  },
                  color1: Color(0xffaac9bf),
                  color2: Color(0xff25af7f),
                ),
              ),
            ],
          )),
    );
  }
}

class classroomSeatArrange2 extends StatelessWidget {
  const classroomSeatArrange2({
    Key? key,
    required this.seats,
  }) : super(key: key);
  final int seats;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: seats,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisExtent: 75.h,
            crossAxisSpacing: 10,
            childAspectRatio: 0.8,
            mainAxisSpacing: 10),
        itemBuilder: (BuildContext context, int index) {
          return Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  )),
              child: Image.asset(sr));
        });
  }
}

class classroomSeatArrange extends StatelessWidget {
  const classroomSeatArrange({
    Key? key,
    required this.seats,
  }) : super(key: key);
  final int seats;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Stack(
        children: [
          GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: seats,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 50.h,
                  crossAxisSpacing: 100,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 0),
              itemBuilder: (BuildContext context, int index) {
                bool isEven = index % 2 == 0;
                return Container(
                    padding: const EdgeInsets.all(16),
                    width: double.infinity,
                    child: Image.asset(isEven ? sr : sl));
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.all(16),
                  width: MediaQuery.sizeOf(context).width / 3,
                  decoration: const BoxDecoration(
                    color: Color(0xffd9d9d9),
                  ))
            ],
          )
        ],
      ),
    ));
  }
}
