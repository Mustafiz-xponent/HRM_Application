import 'package:flutter/material.dart';
import 'package:hrm_application/core/theme/app_colors.dart';
import 'package:hrm_application/features/attendance/view/attendance_screen.dart';
import 'package:hrm_application/features/dashboard/view/dashboard_screen.dart';
import 'package:hrm_application/features/movement_log/view/movement_log_screen.dart';
import 'package:hrm_application/features/profile/view/profile_screen.dart';
import 'package:hrm_application/features/tasks/view/add_tasks_screen.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int currentIndex = 0;
  List screens = [
    DashboardScreen(),
    // AttendanceScreen(),
    AddTasksScreen(),
    // MovementLogScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),

        child: BottomNavigationBar(
          elevation: 5,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.primaryColor,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.house),
              label: "Dashboard",
            ),

            // BottomNavigationBarItem(
            //   icon: Icon(LucideIcons.clock),
            //   label: "Attendance",
            // ),
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.plus),
              label: "Add Task",
            ),

            // BottomNavigationBarItem(
            //   icon: Icon(LucideIcons.mapPin),
            //   label: "Movement",
            // ),
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.user),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
