import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_classroom/common/theme/colors.dart';
import 'package:flutter_classroom/common/theme/textstyle.dart';

class AppTheme {
  ThemeData themeData({bool isDark = false}) {
    return ThemeData(
      // useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,
      iconTheme: IconThemeData(color: isDark ? DarkIconColor : LightIconColor),
      hintColor: Colors.grey,
      primaryColor: isDark ? DarkPrimary : LightPrimary,
      scaffoldBackgroundColor:
          isDark ? DarkBackgroundColor : LightBackgroundColor,
      colorScheme: isDark ? darkColorScheme : lightColorScheme,
      cardColor: isDark ? DarkOnsurfaceColor : LightsurfaceColor,
      textTheme: buildTextTheme,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: (Platform.isIOS)
            ? SystemUiOverlayStyle.dark
            : const SystemUiOverlayStyle(
                statusBarColor: LightPrimary,
                statusBarIconBrightness: Brightness.light,
                statusBarBrightness: Brightness.dark,
              ),
        backgroundColor: isDark ? DarkBackgroundColor : LightBackgroundColor,
        elevation: 0,
        toolbarTextStyle: TextStyle(
          color: isDark ? DarkOnBackgroundColor : LightOnBackgroundColor,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        titleTextStyle: headlineSmall.copyWith(
          color: isDark ? DarkOnBackgroundColor : LightOnBackgroundColor,
        ),
        iconTheme:
            IconThemeData(color: isDark ? DarkIconColor : LightIconColor),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      }),
      tabBarTheme: const TabBarTheme(
        labelColor: Colors.black,
        unselectedLabelColor: Colors.black,
        labelPadding: EdgeInsets.zero,
        labelStyle: TextStyle(fontSize: 13),
        unselectedLabelStyle: TextStyle(fontSize: 13),
        dividerColor: Colors.transparent,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(horizontal: 10, vertical: 14)),
        overlayColor: WidgetStateProperty.all<Color>(
            isDark ? DarkPrimary : LightPrimary.withOpacity(0.3)),
        // textStyle:
        //     WidgetStateProperty.all<TextStyle>(buildTextTheme.titleLarge!),
        shape: WidgetStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
          8,
        ))),
        backgroundColor:
            WidgetStateProperty.all(isDark ? DarkSecondary : LightSecondary),
        foregroundColor: WidgetStateProperty.all(
            isDark ? DarkOnSecondary : LightOnSecondary),
      )),
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: TextStyle(color: isDark ? DarkIconColor : LightIconColor),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelStyle: TextStyle(color: isDark ? DarkTextColor : LightTextColor),
      ),
    );
  }
}
