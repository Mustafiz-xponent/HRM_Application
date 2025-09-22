import 'package:flutter/material.dart';
import 'package:hrm_application/core/theme/app_colors.dart';
import 'package:hrm_application/core/theme/app_styles.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        actionsPadding: EdgeInsets.symmetric(horizontal: 20),
        scrolledUnderElevation: 0,

        title: Row(
          spacing: 12,
          children: [
            // User Profile Picture
            CircleAvatar(radius: 22, backgroundColor: Colors.grey[300]),
            // User Name and User Employee Number
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'User Name',
                  style: AppStyles.mediumBlackNormalTitleFontStyle,
                ),

                Text(
                  'Employee Id Number',
                  style: AppStyles.smallBlackNormalTitleFontStyle,
                ),
              ],
            ),
          ],
        ),

        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(LucideIcons.bell, size: 18),
          ),
          ShadPopover(
            controller: popoverController,
            child: GestureDetector(
              onTap: () {
                popoverController.toggle();
              },
              child: Icon(LucideIcons.menu, size: 18),
            ),
            popover: (context) {
              return Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Employee Directory
                  PopOverMenuItems(
                    icon: LucideIcons.users,
                    title: "Employee Directory",
                    onTap: () {},
                  ),

                  // Leave Management
                  PopOverMenuItems(
                    icon: LucideIcons.calendar,
                    title: "Leave Management",
                    onTap: () {},
                  ),

                  // Loan Management
                  PopOverMenuItems(
                    icon: LucideIcons.dollarSign,
                    title: "Loan Management",
                    onTap: () {},
                  ),

                  // Tasks Management
                  PopOverMenuItems(
                    icon: LucideIcons.listTodo,
                    title: "Task Management",
                    onTap: () {},
                  ),

                  // Documents
                  PopOverMenuItems(
                    icon: LucideIcons.file,
                    title: "Documents",
                    onTap: () {},
                  ),

                  // Performance
                  PopOverMenuItems(
                    icon: LucideIcons.trendingUp,
                    title: "Performance",
                    onTap: () {},
                  ),

                  // Shift Management
                  PopOverMenuItems(
                    icon: LucideIcons.settings,
                    title: "Shift Management",
                    onTap: () {},
                  ),

                  // Messaging
                  PopOverMenuItems(
                    icon: LucideIcons.messageCircle,
                    title: "Messaging",
                    onTap: () {},
                  ),

                  SizedBox(width: 180, child: Divider()),

                  // Logout
                  PopOverMenuItems(
                    icon: LucideIcons.logOut,
                    title: "Logout",
                    onTap: () {},
                  ),
                ],
              );
            },
          ),
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
                    mainAxisExtent: 125,
                  ),
                  itemCount: dashboardData.length,
                  itemBuilder: (context, index) {
                    return ShadCard(
                      padding: EdgeInsets.all(20),
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
                                  style: AppStyles.largeBlackBoldTitleFontStyle,
                                ),
                                Text(
                                  dashboardData[index]["title"],
                                  style:
                                      AppStyles.mediumBlackNormalTitleFontStyle,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),

                // Today's Attendance
                ShadCard(
                  child: Column(
                    spacing: 12,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Today's Attendance",
                        style: AppStyles.mediumBlackBoldTitleFontStyle,
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
                            shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                width: 2,
                                color: Color(0xff00c951),
                              ),
                            ),
                            child: const Text('Checked In'),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Check-in",
                                style:
                                    AppStyles.mediumBlackNormalTitleFontStyle,
                              ),

                              Text(
                                "09:15 AM",
                                style: AppStyles.mediumBlackBoldTitleFontStyle,
                              ),
                            ],
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Working Hours",
                                style:
                                    AppStyles.mediumBlackNormalTitleFontStyle,
                              ),

                              Text(
                                "5H 30M",
                                style: AppStyles.mediumBlackBoldTitleFontStyle,
                              ),
                            ],
                          ),
                        ],
                      ),

                      ShadButton.outline(
                        decoration: ShadDecoration(
                          border: ShadBorder.all(color: AppColors.primaryColor),
                        ),
                        width: double.infinity,
                        child: Text(
                          'Check Out',
                          style: AppStyles.mediumBlackBoldTitleFontStyle,
                        ),
                        onPressed: () {
                          ShadToaster.of(context).show(
                            ShadToast(
                              title: const Text('Scheduled: Catch up'),
                              description: const Text(
                                'Friday, February 10, 2023 at 5:57 PM',
                              ),
                              action: ShadButton.outline(
                                child: const Text('Undo'),
                                onPressed: () => ShadToaster.of(context).hide(),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                // My Tasks
                ShadCard(
                  child: Column(
                    spacing: 12,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "My tasks",
                        style: AppStyles.mediumBlackBoldTitleFontStyle,
                      ),

                      Text(
                        "My Recent tasks",
                        style: AppStyles.mediumBlackNormalTitleFontStyle,
                      ),

                      Column(
                        spacing: 10,
                        children: [
                          ShadCard(
                            backgroundColor: Color(0xfff5f8fa),
                            padding: EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 8,
                              children: [
                                Text(
                                  "Complete Q4 Report",
                                  style:
                                      AppStyles.mediumBlackBoldTitleFontStyle,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ShadBadge.outline(child: Text('Today')),
                                    ShadBadge(
                                      backgroundColor: Color(0xffff822e),
                                      child: const Text('In Progress'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          ShadCard(
                            backgroundColor: Color(0xfff5f8fa),
                            padding: EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 8,
                              children: [
                                Text(
                                  "Team Meeting Preparation",
                                  style:
                                      AppStyles.mediumBlackBoldTitleFontStyle,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ShadBadge.outline(child: Text('Yesterday')),
                                    ShadBadge(
                                      backgroundColor: Color(0xff00c951),
                                      child: const Text('Completed'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          ShadCard(
                            backgroundColor: Color(0xfff5f8fa),
                            padding: EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 8,
                              children: [
                                Text(
                                  "Client Presentation",
                                  style:
                                      AppStyles.mediumBlackBoldTitleFontStyle,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ShadBadge.outline(child: Text('Yesterday')),
                                    ShadBadge(
                                      backgroundColor: Color(0xff00c951),
                                      child: const Text('Completed'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
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

                // Today's Schedule
                ShadCard(
                  child: Column(
                    spacing: 12,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Today's Schedule",
                        style: AppStyles.mediumBlackBoldTitleFontStyle,
                      ),

                      ShadCard(
                        width: double.infinity,
                        backgroundColor: Color(0xfff5f8fa),
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          spacing: 4,
                          children: [
                            Text(
                              "Daily Standup",
                              style: AppStyles.mediumBlackBoldTitleFontStyle,
                            ),
                            Text(
                              "09:00 AM",
                              style: AppStyles.mediumBlackNormalTitleFontStyle,
                            ),
                          ],
                        ),
                      ),

                      ShadCard(
                        width: double.infinity,
                        backgroundColor: Color(0xfff5f8fa),
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          spacing: 4,
                          children: [
                            Text(
                              "Project Review",
                              style: AppStyles.mediumBlackBoldTitleFontStyle,
                            ),
                            Text(
                              "03:30 PM",
                              style: AppStyles.mediumBlackNormalTitleFontStyle,
                            ),
                          ],
                        ),
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
