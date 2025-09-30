import 'package:flutter/material.dart';
import 'package:hrm_application/core/theme/app_colors.dart';
import 'package:hrm_application/core/theme/app_styles.dart';
import 'package:hrm_application/core/widgets/custom_button_widget.dart';
import 'package:hrm_application/features/attendance/view/attendance_screen.dart';
import 'package:hrm_application/features/leave/view/leave_management_screen.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final popoverController = ShadPopoverController();
  List<Map<String, dynamic>> dashboardData = [
    {
      "title": "Pending Tasks",
      "qty": 5,
      "icon": LucideIcons.clock,
      "iconColor": Color(0xffff822e),
    },

    {
      "title": "Completed Tasks",
      "qty": 12,
      "icon": LucideIcons.circleCheck,
      "iconColor": Color(0xff00c951),
    },

    {
      "title": "OverTime Hours",
      "qty": 8,
      "icon": LucideIcons.trendingUp,
      "iconColor": Color(0xff2b80ff),
    },

    {
      "title": "Pending Leaves",
      "qty": 5,
      "icon": LucideIcons.calendar,
      "iconColor": Color(0xffab45ff),
    },
  ];

  List<Map<String, dynamic>> actionsData = [
    {
      "title": "Attendance",
      "icon": LucideIcons.clock,
      "iconColor": Color(0xffff822e),
    },

    {
      "title": "Movement",
      "icon": LucideIcons.mapPin,
      "iconColor": Color(0xff00c951),
    },
    {
      "title": "Employee Directory",
      "icon": LucideIcons.users,
      "iconColor": Color(0xffff822e),
    },

    {
      "title": "Leave Management",
      "icon": LucideIcons.calendar,
      "iconColor": Color(0xff00c951),
    },

    {
      "title": "Loan Management",
      "icon": LucideIcons.dollarSign,
      "iconColor": Color(0xff2b80ff),
    },

    {
      "title": "Task Management",
      "icon": LucideIcons.listTodo,
      "iconColor": Color(0xffab45ff),
    },
    {
      "title": "Documents",
      "icon": LucideIcons.file,
      "iconColor": Color(0xffab45ff),
    },
    {
      "title": "Performance",
      "icon": LucideIcons.trendingUp,
      "iconColor": Color(0xffab45ff),
    },
    {
      "title": "Shift Management",
      "icon": LucideIcons.settings,
      "iconColor": Color(0xffab45ff),
    },
  ];

  bool isCheckedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 85,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryColor,
        actionsPadding: EdgeInsets.symmetric(horizontal: 20),
        scrolledUnderElevation: 0,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),

        title: Row(
          spacing: 12,
          children: [
            // User Profile Picture
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=764&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              ),
            ),
            // User Name and User Employee Number
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Aiony Haust',
                  style: AppStyles.mediumWhiteBoldTitleFontStyle,
                ),

                Text(
                  'ID: EMP1122',
                  style: AppStyles.smallWhiteNormalTitleFontStyle,
                ),
              ],
            ),
          ],
        ),

        actions: [
          Icon(LucideIcons.bell, size: 22, color: Colors.white),
          // ShadPopover(
          //   controller: popoverController,
          //   child: GestureDetector(
          //     onTap: () {
          //       popoverController.toggle();
          //     },
          //     child: Icon(LucideIcons.menu, size: 18),
          //   ),
          //   popover: (context) {
          //     return Column(
          //       spacing: 10,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         // Employee Directory
          //         PopOverMenuItems(
          //           icon: LucideIcons.users,
          //           title: "Employee Directory",
          //           onTap: () {},
          //         ),

          //         // Leave Management
          //         PopOverMenuItems(
          //           icon: LucideIcons.calendar,
          //           title: "Leave Management",
          //           onTap: () {},
          //         ),

          //         // Loan Management
          //         PopOverMenuItems(
          //           icon: LucideIcons.dollarSign,
          //           title: "Loan Management",
          //           onTap: () {},
          //         ),

          //         // Tasks Management
          //         PopOverMenuItems(
          //           icon: LucideIcons.listTodo,
          //           title: "Task Management",
          //           onTap: () {},
          //         ),

          //         // Documents
          //         PopOverMenuItems(
          //           icon: LucideIcons.file,
          //           title: "Documents",
          //           onTap: () {},
          //         ),

          //         // Performance
          //         PopOverMenuItems(
          //           icon: LucideIcons.trendingUp,
          //           title: "Performance",
          //           onTap: () {},
          //         ),

          //         // Shift Management
          //         PopOverMenuItems(
          //           icon: LucideIcons.settings,
          //           title: "Shift Management",
          //           onTap: () {},
          //         ),

          //         // Messaging
          //         PopOverMenuItems(
          //           icon: LucideIcons.messageCircle,
          //           title: "Messaging",
          //           onTap: () {},
          //         ),

          //         SizedBox(width: 180, child: Divider()),

          //         // Logout
          //         PopOverMenuItems(
          //           icon: LucideIcons.logOut,
          //           title: "Logout",
          //           onTap: () {},
          //         ),
          //       ],
          //     );
          //   },
          // ),
        ],
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 15,
              children: [
                // Grid of Pending Tasks, Completed Tasks, Overtime hours, Pending Leaves
                GridView.builder(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.65,
                  ),
                  itemCount: dashboardData.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          spacing: 10,
                          children: [
                            ShadIconButton(
                              backgroundColor: Color(0xffe9f0f5),
                              height: 35,
                              width: 35,
                              onPressed: () => print('Primary'),
                              icon: Icon(
                                dashboardData[index]["icon"],
                                size: 20,
                                color: dashboardData[index]["iconColor"],
                              ),
                            ),

                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    dashboardData[index]["qty"].toString(),
                                    style:
                                        AppStyles.largeBlackBoldTitleFontStyle,
                                  ),
                                  Text(
                                    dashboardData[index]["title"],
                                    style: AppStyles
                                        .mediumBlackNormalTitleFontStyle,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

                // // Today's Attendance
                // Column(
                //   spacing: 12,
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text(
                //       "Today's Attendance",
                //       style: AppStyles.mediumBlackBoldTitleFontStyle,
                //     ),

                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Row(
                //           spacing: 6,
                //           children: [
                //             Icon(LucideIcons.mapPin, size: 18),
                //             Text(
                //               "Office Location",
                //               style: AppStyles.smallBlackNormalTitleFontStyle,
                //             ),
                //           ],
                //         ),
                //         ShadBadge.outline(
                //           child: Text(
                //             isCheckedIn ? 'Checked In' : "Not Checked In",
                //           ),
                //         ),
                //       ],
                //     ),

                //     Visibility(
                //       visible: isCheckedIn ? true : false,
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Text(
                //                 "Check-in",
                //                 style:
                //                     AppStyles.mediumBlackNormalTitleFontStyle,
                //               ),

                //               Text(
                //                 "09:15 AM",
                //                 style: AppStyles.mediumBlackBoldTitleFontStyle,
                //               ),
                //             ],
                //           ),

                //           Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Text(
                //                 "Working Hours",
                //                 style:
                //                     AppStyles.mediumBlackNormalTitleFontStyle,
                //               ),

                //               Text(
                //                 "5H 30M",
                //                 style: AppStyles.mediumBlackBoldTitleFontStyle,
                //               ),
                //             ],
                //           ),
                //         ],
                //       ),
                //     ),

                //     CustomButtonWidget(
                //       buttonTitle: "Check In",
                //       buttonBackground: AppColors.primaryColor,
                //       onTap: () {
                //         ShadToaster.of(context).show(
                //           ShadToast(
                //             title: const Text('Scheduled: Catch up'),
                //             description: const Text(
                //               'Friday, February 10, 2023 at 5:57 PM',
                //             ),
                //             action: ShadButton.outline(
                //               child: const Text('Undo'),
                //               onPressed: () => ShadToaster.of(context).hide(),
                //             ),
                //           ),
                //         );
                //       },
                //       leadingIcon: Icon(LucideIcons.mapPin, size: 18),
                //     ),
                //   ],
                // ),

                // Actions
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 12,
                  children: [
                    Text(
                      "Actions",
                      style: AppStyles.mediumBlackBoldTitleFontStyle,
                    ),

                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 12,
                        childAspectRatio: 1.2,
                      ),
                      itemCount: actionsData.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            if (index == 0) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AttendanceScreen(),
                                ),
                              );
                            } else if (index == 3) {
                              // Navigate to Leave Management Screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LeaveManagementScreen(),
                                ),
                              );
                            } else if (index == 5) {
                              // Navigate to Task Management Screen
                            }
                          },
                          child: Card(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                spacing: 6,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(actionsData[index]["icon"]),
                                  Text(
                                    actionsData[index]["title"],
                                    textAlign: TextAlign.center,
                                    style:
                                        AppStyles.smallBlackBoldTitleFontStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),

                // My Tasks
                Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Company News",
                      style: AppStyles.mediumBlackBoldTitleFontStyle,
                    ),

                    Column(
                      spacing: 6,
                      children: [
                        ShadCard(
                          backgroundColor: Color(0xffffffff),
                          padding: EdgeInsets.all(15),
                          child: Row(
                            spacing: 10,
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    2,
                                  ),
                                ),
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Container(
                                      color: AppColors.primaryColor,
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Center(
                                          child: Text(
                                            "Sep",
                                            style: AppStyles
                                                .smallWhiteBoldTitleFontStyle,
                                          ),
                                        ),
                                      ),
                                    ),

                                    Text(
                                      "31",
                                      style: AppStyles
                                          .smallBlackBoldTitleFontStyle,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 4,
                                  children: [
                                    Text(
                                      "Reminder: Meeting Tomorrow",
                                      style: AppStyles
                                          .mediumBlackBoldTitleFontStyle,
                                    ),
                                    Text(
                                      "This Is A Friendly Reminder That Our Team Meeting Is Scheduled For Tomorrow, At 2:00 PM",
                                      style: AppStyles
                                          .smallBlackNormalTitleFontStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        ShadCard(
                          backgroundColor: Color(0xffffffff),
                          padding: EdgeInsets.all(15),
                          child: Row(
                            spacing: 10,
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    2,
                                  ),
                                ),
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Container(
                                      color: AppColors.primaryColor,
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Center(
                                          child: Text(
                                            "Sep",
                                            style: AppStyles
                                                .smallWhiteBoldTitleFontStyle,
                                          ),
                                        ),
                                      ),
                                    ),

                                    Text(
                                      "31",
                                      style: AppStyles
                                          .smallBlackBoldTitleFontStyle,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 4,
                                  children: [
                                    Text(
                                      "Reminder: Meeting Tomorrow",
                                      style: AppStyles
                                          .mediumBlackBoldTitleFontStyle,
                                    ),
                                    Text(
                                      "This Is A Friendly Reminder That Our Team Meeting Is Scheduled For Tomorrow, At 2:00 PM",
                                      style: AppStyles
                                          .smallBlackNormalTitleFontStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        ShadCard(
                          backgroundColor: Color(0xffffffff),
                          padding: EdgeInsets.all(15),
                          child: Row(
                            spacing: 10,
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    2,
                                  ),
                                ),
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Container(
                                      color: AppColors.primaryColor,
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Center(
                                          child: Text(
                                            "Sep",
                                            style: AppStyles
                                                .smallWhiteBoldTitleFontStyle,
                                          ),
                                        ),
                                      ),
                                    ),

                                    Text(
                                      "31",
                                      style: AppStyles
                                          .smallBlackBoldTitleFontStyle,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 4,
                                  children: [
                                    Text(
                                      "Reminder: Meeting Tomorrow",
                                      style: AppStyles
                                          .mediumBlackBoldTitleFontStyle,
                                    ),
                                    Text(
                                      "This Is A Friendly Reminder That Our Team Meeting Is Scheduled For Tomorrow, At 2:00 PM",
                                      style: AppStyles
                                          .smallBlackNormalTitleFontStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                // Monthly Attendance
                ShadCard(
                  child: Column(
                    spacing: 12,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Monthly Attendance",
                        style: AppStyles.mediumBlackBoldTitleFontStyle,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Present Days",
                            style: AppStyles.mediumBlackNormalTitleFontStyle,
                          ),

                          Text(
                            "18/22",
                            style: AppStyles.mediumBlackNormalTitleFontStyle,
                          ),
                        ],
                      ),

                      ShadProgress(
                        value: 0.8,
                        color: AppColors.primaryColor,
                        backgroundColor: Color(0xffccdbde),
                        minHeight: 10,
                      ),

                      Text(
                        "82% attendance this month",
                        style: AppStyles.mediumBlackNormalTitleFontStyle,
                      ),
                    ],
                  ),
                ),

                // // Today's Schedule
                // ShadCard(
                //   child: Column(
                //     spacing: 12,
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text(
                //         "Today's Schedule",
                //         style: AppStyles.mediumBlackBoldTitleFontStyle,
                //       ),

                //       ShadCard(
                //         width: double.infinity,
                //         backgroundColor: Color(0xfff5f8fa),
                //         padding: EdgeInsets.all(15),
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,

                //           spacing: 4,
                //           children: [
                //             Text(
                //               "Daily Standup",
                //               style: AppStyles.mediumBlackBoldTitleFontStyle,
                //             ),
                //             Text(
                //               "09:00 AM",
                //               style: AppStyles.mediumBlackNormalTitleFontStyle,
                //             ),
                //           ],
                //         ),
                //       ),

                //       ShadCard(
                //         width: double.infinity,
                //         backgroundColor: Color(0xfff5f8fa),
                //         padding: EdgeInsets.all(15),
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,

                //           spacing: 4,
                //           children: [
                //             Text(
                //               "Project Review",
                //               style: AppStyles.mediumBlackBoldTitleFontStyle,
                //             ),
                //             Text(
                //               "03:30 PM",
                //               style: AppStyles.mediumBlackNormalTitleFontStyle,
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PopOverMenuItems extends StatelessWidget {
  final IconData icon;
  final String title;
  final GestureTapCallback onTap;
  const PopOverMenuItems({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 12,
        children: [
          Icon(icon, size: 18),
          Text(title, style: AppStyles.mediumBlackNormalTitleFontStyle),
        ],
      ),
    );
  }
}
