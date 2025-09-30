import 'package:flutter/material.dart';
import 'package:hrm_application/core/theme/app_colors.dart';
import 'package:hrm_application/core/theme/app_styles.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LoanManagementScreen extends StatelessWidget {
  const LoanManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.only(right: 20),
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: Text(
          'Loan Management',
          style: AppStyles.largeBlackBoldTitleFontStyle,
        ),

        actions: [
          GestureDetector(
            onTap: () {
              showShadDialog(
                context: context,
                builder: (context) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ShadDialog(
                    title: Text(
                      "Apply for Leave",
                      style: AppStyles.mediumBlackBoldTitleFontStyle,
                    ),

                    child: Column(
                      spacing: 15,
                      children: [
                        // Leave Type Dropdown
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Leave Type",
                              style: AppStyles.smallBlackBoldTitleFontStyle,
                            ),

                            // CustomDropdown(
                            //   itemList: itemList,
                            //   hintText: "leave type",
                            // ),
                          ],
                        ),

                        // Dates Selection
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "From",
                                    style:
                                        AppStyles.smallBlackBoldTitleFontStyle,
                                  ),

                                  ShadDatePicker(
                                    closeOnSelection: true,
                                    formatDate: (p0) {
                                      return DateFormat(
                                        'dd-MM-yyyy',
                                      ).format(p0);
                                    },
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(width: 10),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "To",
                                    style:
                                        AppStyles.smallBlackBoldTitleFontStyle,
                                  ),

                                  ShadDatePicker(
                                    closeOnSelection: true,
                                    formatDate: (p0) {
                                      return DateFormat(
                                        'dd-MM-yyyy',
                                      ).format(p0);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        // Reason for Leave TextArea
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Reason for Leave",
                              style: AppStyles.smallBlackBoldTitleFontStyle,
                            ),

                            ShadTextarea(
                              placeholder: Text(
                                'Please provide deatiled reason for leave requests',
                              ),
                            ),
                          ],
                        ),

                        // Document upload section
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Supporting Document (if any)",
                              style: AppStyles.smallBlackBoldTitleFontStyle,
                            ),

                            Row(
                              children: [
                                Expanded(
                                  child: ShadInput(
                                    placeholder: Text('No file selected'),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                ),

                                ShadIconButton(
                                  backgroundColor: AppColors.primaryColor,
                                  height: 35,
                                  onPressed: () {},
                                  icon: Icon(LucideIcons.upload, size: 20),
                                ),
                              ],
                            ),
                          ],
                        ),

                        // Submit Button and Cancel Button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: ShadButton.outline(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Cancel'),
                              ),
                            ),

                            SizedBox(width: 10),

                            Expanded(
                              child: ShadButton(
                                backgroundColor: AppColors.primaryColor,
                                onPressed: () {
                                  // Handle form submission logic here
                                  Navigator.pop(context);
                                },
                                child: Text('Submit'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.primaryColor,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Text(
                  'Apply Loan',
                  style: AppStyles.smallWhiteBoldTitleFontStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
