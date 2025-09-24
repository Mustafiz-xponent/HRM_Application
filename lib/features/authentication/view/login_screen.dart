import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_application/core/theme/app_colors.dart';
import 'package:hrm_application/core/theme/app_styles.dart';
import 'package:hrm_application/core/widgets/custom_button_widget.dart';
import 'package:hrm_application/features/bottom_navigation_bar_screen.dart/bottom_navigation_bar_screen.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscure = true;
  final _formKey = GlobalKey<ShadFormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ShadCard(
              child: Column(
                spacing: 16,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: AppColors.primaryColor,
                    child: Icon(LucideIcons.building, color: Colors.white),
                  ),
                  Text(
                    "HR Management",
                    style: AppStyles.largeBlackBoldTitleFontStyle,
                  ),

                  Text(
                    'Sign in to access your workplace dashboard',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.balooDa2(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),

                  Column(
                    spacing: 12,
                    children: [
                      ShadForm(
                        key: _formKey,
                        child: Column(
                          spacing: 12,
                          children: [
                            ShadInputFormField(
                              controller: emailController,
                              placeholder: Text('Email Address'),
                              leading: Icon(LucideIcons.mail, size: 18),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Email is required";
                                }

                                return null;
                              },
                            ),

                            ShadInputFormField(
                              controller: passwordController,
                              placeholder: const Text('Password'),
                              obscureText: isObscure,
                              leading: Icon(LucideIcons.lock, size: 18),
                              trailing: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isObscure = !isObscure;
                                  });
                                },
                                child: Icon(
                                  isObscure
                                      ? LucideIcons.eyeOff
                                      : LucideIcons.eye,
                                  size: 18,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Password is required";
                                }

                                return null;
                              },
                            ),
                          ],
                        ),
                      ),

                      // ShadButton(
                      //   backgroundColor: AppColors.primaryColor,
                      //   width: double.infinity,
                      //   child: Text(
                      //     'Sign in',
                      //     style: AppStyles.mediumWhiteBoldTitleFontStyle,
                      //   ),
                      //   onPressed: () {
                      //     if (_formKey.currentState!.validate()) {
                      //       Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (context) =>
                      //               BottomNavigationBarScreen(),
                      //         ),
                      //       );
                      //     }
                      //   },
                      // ),
                      CustomButtonWidget(
                        buttonTitle: "Sign in",
                        buttonBackground: AppColors.primaryColor,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    BottomNavigationBarScreen(),
                              ),
                            );
                          }
                        },
                      ),

                      Text(
                        'Forgot Password?',
                        style: AppStyles.mediumBlackBoldTitleFontStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
