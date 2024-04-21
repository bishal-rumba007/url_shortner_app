



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vrit_app/core/theme/app_theme.dart';
import 'package:vrit_app/src/main/presentation/main_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 873),
      builder: (context, child) {
        return MaterialApp(
          title: 'Url Shortner App',
          theme: AppTheme.darkMode,
          debugShowCheckedModeBanner: false,
          home: const MainScreen(),
        );
      }
    );
  }
}
