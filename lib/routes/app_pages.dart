import 'package:flutter_classroom/modules/classroom/controller/classroom_binding.dart';
import 'package:flutter_classroom/modules/classroom/view/screen_classroom.dart';
import 'package:flutter_classroom/modules/classroom/view/screen_classroom_details.dart';
import 'package:flutter_classroom/modules/home/controller/home_binding.dart';
import 'package:flutter_classroom/modules/home/view/screen_home.dart';
import 'package:flutter_classroom/modules/registration/controller/register_binding.dart';
import 'package:flutter_classroom/modules/registration/view/screen_new_registration.dart';
import 'package:flutter_classroom/modules/registration/view/screen_registration_list.dart';
import 'package:flutter_classroom/modules/students/controller/student_binding.dart';
import 'package:flutter_classroom/modules/students/view/screen_student_detail.dart';
import 'package:flutter_classroom/modules/students/view/screen_students.dart';
import 'package:flutter_classroom/modules/subjects/controller/subjects_binding.dart';
import 'package:flutter_classroom/modules/subjects/view/screen_subject.dart';
import 'package:flutter_classroom/modules/subjects/view/screen_subject_details.dart';
import 'package:flutter_classroom/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.HOME;
  static final List<GetPage> pages = [
    GetPage(
        name: Routes.HOME,
        page: () => ScreenHome(),
        binding: HomeBinding(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.STUDENTS,
        page: () => const ScreenStudents(),
        binding: StudentBinding(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.STUDENTS_DETAILS,
        page: () => const ScreenStudentDetail(),
        binding: StudentBinding(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.SUBJECT,
        page: () => const ScreenSubject(),
        binding: SubjectBinding(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.SUBJECT_DETAILS,
        page: () => const ScreenSubjectDetail(),
        binding: SubjectBinding(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.CLASSROOM,
        page: () => const ScreenClassroom(),
        binding: ClassroomBinding(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.CLASSROOM_DETAILS,
        page: () => const ScreenClassroomDetails(),
        binding: ClassroomBinding(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.REGISTRATION_LIST,
        page: () => const ScreenRegistrationList(),
        binding: RegistrationBinding(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.NEW_REGISTRATION,
        page: () => const ScreenNewRegistration(),
        binding: RegistrationBinding(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.fadeIn),
  ];
}
