// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegistrationCardWidet extends StatelessWidget {
  const RegistrationCardWidet({
    Key? key,
    required this.id,
    required this.onDelete,
  }) : super(key: key);
  final String id;
  final Function onDelete;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
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
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Registration Id: #$id',
                        style: TextStyle(fontSize: 15.sp),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {
                    onDelete();
                  },
                  icon: Icon(
                    Icons.delete_forever_outlined,
                    color: Colors.red,
                  ))
            ],
          )),
    );
  }
}
