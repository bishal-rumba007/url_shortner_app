import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SnackBarUtil {
  static SnackBar showSnackBar(String message) {
    return SnackBar(
      duration: const Duration(milliseconds: 1400),
      content: Center(
        child: Text(
          message,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.grey.shade300,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(horizontal: 80.w, vertical: 80.h),
    );
  }

}