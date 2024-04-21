



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vrit_app/core/theme/app_color.dart';



class AppTheme{
  static ThemeData darkMode = ThemeData(
    useMaterial3: true,
    splashColor: AppColor.kPrimaryColor.withOpacity(0.5),
    colorScheme: ColorScheme.dark(
      brightness: Brightness.dark,
      background: AppColor.darkColor,
      onBackground: AppColor.darkColor.withOpacity(0.4),
      primary: AppColor.kPrimaryColor,
      surface: Colors.grey.shade800,
      onSurface: const Color(0xFFf5f5f5),
      inverseSurface: Colors.grey.shade50,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF1F1E1F),
      titleTextStyle: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        color: AppColor.darkModeText,
        letterSpacing: 2.0,
      ),
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50.h),
        textStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
          color: Colors.white,
        ),
        backgroundColor: AppColor.kPrimaryColor,
        foregroundColor: Colors.white,
        elevation: 2,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: Colors.grey.shade700, width: 1.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: Colors.grey.shade600, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(color: AppColor.kPrimaryColor, width: 1.8),
      ),
      labelStyle: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w500,
        color: AppColor.darkModeText,
      ),
      hintStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColor.darkModeText,
      ),
      floatingLabelStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: AppColor.kPrimaryColor,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: const BorderSide(color: AppColor.kPrimaryColor, width: 1.5),
      ),
      errorStyle: TextStyle(
        fontSize: 14.sp,
        color: AppColor.kPrimaryColor,
      ),
      suffixIconColor: AppColor.kPrimaryColor,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: AppColor.darkModeText,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColor.darkModeText,
      ),
      bodySmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: AppColor.darkModeText,
      ),
      labelLarge: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w600,
        color: AppColor.darkModeText,
      ),
      labelMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColor.darkModeText,
      ),
      labelSmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: AppColor.darkModeText,
      ),
    ),
  );
}