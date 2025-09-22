import 'package:flutter/material.dart';
import 'package:hrm_application/core/theme/app_colors.dart';
import 'package:hrm_application/features/authentication/view/login_screen.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ShadApp(
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData().copyWith(
            scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
          ),
          debugShowCheckedModeBanner: false,
          home: LoginScreen(),
        );
      },
    );
  }
}
