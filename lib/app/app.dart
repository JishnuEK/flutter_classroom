import 'package:flutter/material.dart';
import 'package:flutter_classroom/app/app_binding.dart';
import 'package:flutter_classroom/common/theme/app_theme.dart';
import 'package:flutter_classroom/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'ji',
            initialBinding: AppBinding(),
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.pages,
            theme: AppTheme().themeData(),
            // home: CashfreePayment(),
          );
        });
  }
}
