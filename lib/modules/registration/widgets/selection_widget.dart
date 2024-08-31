import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum REgisterClassType { subject, student }

class RegisterSelectWidget extends StatelessWidget {
  const RegisterSelectWidget({
    Key? key,
    required this.isselected,
    this.name = '',
    required this.onselect,
    required this.type,
  }) : super(key: key);
  final bool isselected;
  final String name;
  final Function onselect;
  final REgisterClassType type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: GestureDetector(
        onTap: () {
          onselect();
        },
        child: Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                )),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          isselected
                              ? name
                              : (type == REgisterClassType.student
                                  ? 'Add Student'
                                  : 'Add Subject'),
                          style: TextStyle(fontSize: 15.sp),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward_ios)
              ],
            )),
      ),
    );
  }
}
