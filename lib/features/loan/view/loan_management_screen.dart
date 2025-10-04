import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_application/core/theme/app_colors.dart';
import 'package:hrm_application/core/theme/app_styles.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LoanManagementScreen extends StatefulWidget {
  const LoanManagementScreen({super.key});

  @override
  State<LoanManagementScreen> createState() => _LoanManagementScreenState();
}

class _LoanManagementScreenState extends State<LoanManagementScreen> {
  List loanHistory = [
    {
      'totalAmount': '25000',
      'emiAmount': '2000',
      'comments': 'Emergency Household work',
      'date': '2025-01-15',
      'status': 'Approved',
    },
    {
      'totalAmount': '45000',
      'emiAmount': '4000',
      'comments': 'Personal Work',
      'date': '2025-02-10',
      'status': 'Pending',
    },
    {
      'totalAmount': '42000',
      'emiAmount': '1000',
      'comments': 'Emergency Household work',
      'date': '2025-03-05',
      'status': 'Rejected',
    },
  ];
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

      body: Container(
        child: Padding(
          padding: EdgeInsetsGeometry.fromLTRB(20, 10, 20, 0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 15,
              children: [
                ShadCard(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    spacing: 10,
                    children: [
                      Row(
                        spacing: 15,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Color(0xfff0f6ff),
                              ),
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text(
                                    '25,000000',
                                    style: GoogleFonts.balooDa2(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff1160f2),
                                    ),
                                  ),

                                  Text(
                                    'Total Loan Amount',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.balooDa2(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff909da6),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Color(0xfff0fcf4),
                              ),
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text(
                                    '15,000',
                                    style: GoogleFonts.balooDa2(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff119e55),
                                    ),
                                  ),

                                  Text(
                                    'Total Paid Amount',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.balooDa2(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff909da6),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      Row(
                        spacing: 15,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Color(0xfffff8ed),
                              ),
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text(
                                    '150,000',
                                    style: GoogleFonts.balooDa2(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xfff97316),
                                    ),
                                  ),

                                  Text(
                                    'Remaining Amount',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.balooDa2(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff909da6),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Color(0xfffbf5ff),
                              ),
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text(
                                    '1',
                                    style: GoogleFonts.balooDa2(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff8924bf),
                                    ),
                                  ),

                                  Text(
                                    'Active Loans',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.balooDa2(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff909da6),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Loan History Section
                ShadCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Loan History',
                        style: AppStyles.mediumBlackBoldTitleFontStyle,
                      ),

                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: loanHistory.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(12),
                            margin: EdgeInsets.only(top: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Color(0xffe1e5e8)),
                              color: loanHistory[index]['status'] == "Approved"
                                  ? Color(0xfff5fafa)
                                  : loanHistory[index]['status'] == "Pending"
                                  ? Color(0xfffffcf5)
                                  : Color(0xfffdf5f5),
                            ),
                            child: Column(
                              spacing: 8,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ShadBadge(
                                      backgroundColor: Color(0xffd6eaff),
                                      child: Text(
                                        "${loanHistory[index]['totalAmount']}",
                                        style: GoogleFonts.balooDa2(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff2f59ad),
                                        ),
                                      ),
                                    ),

                                    ShadBadge.outline(
                                      backgroundColor: Color(0xfff0f6ff),
                                      child: Text(
                                        loanHistory[index]['status'],
                                        style: GoogleFonts.balooDa2(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              loanHistory[index]['status'] ==
                                                  "Approved"
                                              ? Color(0xff45967a)
                                              : loanHistory[index]['status'] ==
                                                    "Pending"
                                              ? Color(0xffd1642e)
                                              : Color(0xffd32f2f),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                Text(
                                  "EMI Amount: ${loanHistory[index]['emiAmount']}",
                                  style: GoogleFonts.balooDa2(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff6c7868),
                                  ),
                                ),

                                Row(
                                  spacing: 6,
                                  children: [
                                    Icon(
                                      LucideIcons.calendar,
                                      size: 16,
                                      color: Color(0xff6c7868),
                                    ),

                                    Text(
                                      loanHistory[index]['date'],
                                      style: GoogleFonts.balooDa2(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff6c7868),
                                      ),
                                    ),
                                  ],
                                ),

                                Text(
                                  loanHistory[index]['comments'],
                                  style: GoogleFonts.balooDa2(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff6c7868),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
