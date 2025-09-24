import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_application/core/theme/app_colors.dart';
import 'package:hrm_application/core/theme/app_styles.dart';
import 'package:hrm_application/core/widgets/custom_button_widget.dart';
import 'package:one_clock/one_clock.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  bool isCheckedIn = false;

  DateTime currentTime = DateTime.now();

  List<Map<String, dynamic>> monthlyOverviewData = [
    {"title": "Working Days", "qty": 22},

    {"title": "Present Days", "qty": 18},

    {"title": "Late Days", "qty": 6},

    {"title": "Total Hours", "qty": 155},
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    currentTime = DateTime.now();
    print(currentTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: Text(
          'Attendance',
          style: AppStyles.largeBlackBoldTitleFontStyle,
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsetsGeometry.fromLTRB(20, 10, 20, 0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 15,
              children: [
                // Today's Check in Status
                ShadCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 12,
                    children: [
                      Text(
                        "Today's Attendance",
                        style: AppStyles.mediumBlackBoldTitleFontStyle,
                      ),

                      Center(
                        child: AnalogClock(
                          decoration: BoxDecoration(
                            border: Border.all(width: 2.0, color: Colors.black),
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                          ),
                          width: 100.0,
                          height: 100,
                          isLive: true,
                          hourHandColor: Colors.black,
                          minuteHandColor: Colors.black,
                          showSecondHand: true,
                          numberColor: Colors.black87,
                          showNumbers: true,
                          showAllNumbers: true,
                          textScaleFactor: 1.4,
                          showTicks: false,
                          showDigitalClock: false,
                          datetime: currentTime,
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 6,
                            children: [
                              Icon(LucideIcons.mapPin, size: 18),
                              Text(
                                "Office Location",
                                style: AppStyles.smallBlackNormalTitleFontStyle,
                              ),
                            ],
                          ),
                          ShadBadge.outline(
                            child: Text(
                              isCheckedIn ? 'Checked In' : "Not Checked In",
                            ),
                          ),
                        ],
                      ),

                      CustomButtonWidget(
                        buttonTitle: "Check In",
                        buttonBackground: AppColors.primaryColor,
                        onTap: () {},
                        leadingIcon: Icon(LucideIcons.mapPin, size: 18),
                      ),
                    ],
                  ),
                ),

                // Week's Summary
                ShadCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 12,
                    children: [
                      Text(
                        "This Week's Summary",
                        style: AppStyles.mediumBlackBoldTitleFontStyle,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "5",
                                style: GoogleFonts.balooDa2(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff00a63d),
                                ),
                              ),

                              Text(
                                "Present Days",
                                style: AppStyles.smallBlackNormalTitleFontStyle,
                              ),
                            ],
                          ),

                          Column(
                            children: [
                              Text(
                                "6",
                                style: AppStyles.mediumBlackBoldTitleFontStyle,
                              ),

                              Text(
                                "Total Days",
                                style: AppStyles.smallBlackNormalTitleFontStyle,
                              ),
                            ],
                          ),

                          Column(
                            children: [
                              Text(
                                "90%",
                                style: GoogleFonts.balooDa2(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff145efc),
                                ),
                              ),

                              Text(
                                "Attendance",
                                style: AppStyles.smallBlackNormalTitleFontStyle,
                              ),
                            ],
                          ),
                        ],
                      ),

                      Column(
                        spacing: 6,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Weekly Progress",
                                style:
                                    AppStyles.mediumBlackNormalTitleFontStyle,
                              ),

                              Text(
                                "5/6 days",
                                style:
                                    AppStyles.mediumBlackNormalTitleFontStyle,
                              ),
                            ],
                          ),
                          ShadProgress(
                            value: 0.9,
                            color: AppColors.primaryColor,
                            backgroundColor: Color(0xffccdbde),
                            minHeight: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Recent Attendance Records
                ShadCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 12,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Recent Records",
                            style: AppStyles.mediumBlackBoldTitleFontStyle,
                          ),

                          Row(
                            children: [
                              Text(
                                "Show All",
                                style: GoogleFonts.balooDa2(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor,
                                ),
                              ),

                              Icon(
                                LucideIcons.chevronRight,
                                size: 14,
                                color: AppColors.primaryColor,
                              ),
                            ],
                          ),
                        ],
                      ),

                      ShadCard(
                        backgroundColor: Color(0xfff5f8fa),
                        padding: EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          spacing: 8,
                          children: [
                            Row(
                              spacing: 10,
                              children: [
                                Icon(
                                  LucideIcons.circleCheck,
                                  size: 20,
                                  color: Color(0xff00a63d),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Mon, Sep 22",
                                      style: AppStyles
                                          .smallBlackBoldTitleFontStyle,
                                    ),

                                    Text(
                                      "IN: 8:59AM, OUT: 6:03PM",
                                      style: AppStyles
                                          .smallBlackNormalTitleFontStyle,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ShadBadge(
                                  backgroundColor: AppColors.primaryColor,
                                  child: Text(
                                    'Present',
                                    style: AppStyles
                                        .smallBlackNormalTitleFontStyle,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      ShadCard(
                        backgroundColor: Color(0xfff5f8fa),
                        padding: EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          spacing: 8,
                          children: [
                            Row(
                              spacing: 10,
                              children: [
                                Icon(
                                  LucideIcons.triangleAlert,
                                  size: 20,
                                  color: Color(0xfff57640),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Sun, Sep 21",
                                      style: AppStyles
                                          .smallBlackBoldTitleFontStyle,
                                    ),

                                    Text(
                                      "IN: 9:41AM, OUT: 6:03PM",
                                      style: AppStyles
                                          .smallBlackNormalTitleFontStyle,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ShadBadge(
                                  backgroundColor: AppColors.primaryColor,
                                  child: Text(
                                    'Late',
                                    style: AppStyles
                                        .smallBlackNormalTitleFontStyle,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      ShadCard(
                        backgroundColor: Color(0xfff5f8fa),
                        padding: EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          spacing: 8,
                          children: [
                            Row(
                              spacing: 10,
                              children: [
                                Icon(
                                  LucideIcons.circleX,
                                  size: 20,
                                  color: Color(0xffe8202a),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Sun, Sep 21",
                                      style: AppStyles
                                          .smallBlackBoldTitleFontStyle,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ShadBadge(
                                  backgroundColor: Color(0xffe8202a),
                                  child: Text(
                                    'Absent',
                                    style: AppStyles
                                        .smallBlackNormalTitleFontStyle,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Monthly Overview
                ShadCard(
                  child: Column(
                    spacing: 12,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Monthly Overview",
                        style: AppStyles.mediumBlackBoldTitleFontStyle,
                      ),

                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1.7,
                        ),
                        itemCount: monthlyOverviewData.length,
                        itemBuilder: (context, index) {
                          return ShadCard(
                            backgroundColor: Color(0xfff5f8fa),
                            child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    monthlyOverviewData[index]["qty"]
                                        .toString(),
                                    style:
                                        AppStyles.mediumBlackBoldTitleFontStyle,
                                  ),

                                  Text(
                                    monthlyOverviewData[index]["title"],
                                    style: AppStyles
                                        .smallBlackNormalTitleFontStyle,
                                  ),
                                ],
                              ),
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
