import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:hrm_application/core/theme/app_colors.dart';
import 'package:hrm_application/core/theme/app_styles.dart';
import 'package:hrm_application/core/widgets/custom_button_widget.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isPersonalInfoEditable = false;
  bool isProfessionalDetailsEditable = false;
  bool isEmergencyContactEditable = false;
  bool isSkillsExpertiseEditable = false;
  bool isBankAccountEditable = false;

  bool isEducationEditable = false;

  final departmentList = [
    'Engineering',
    'Marketing',
    'Sales',
    'Administration',
    'Sales',
    'Human Resource',
  ];

  final managerList = [
    'Alice Johnson',
    'Ravi Mehta',
    'Micael Jordan',
    'Nijaqat Farooqi',
    'Adnan Alam',
    'Mohammad Fawad',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 332,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 150,
                      color: AppColors.primaryColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "My Profile",
                            style: AppStyles.mediumWhiteBoldTitleFontStyle,
                          ),

                          SizedBox(height: 10),
                          Text(
                            "Employee Information",
                            style: AppStyles.mediumWhiteNormalTitleFontStyle,
                          ),
                        ],
                      ),
                    ),

                    Positioned(
                      top: 120,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        width: MediaQuery.of(context).size.width - 40,
                        child: ShadCard(
                          backgroundColor: Colors.white,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    // Profile Picture
                                    CircleAvatar(
                                      radius: 50,
                                      backgroundImage: NetworkImage(
                                        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=764&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                      ), // Place your image in assets
                                    ),

                                    // Camera Icon Overlay
                                    Positioned(
                                      bottom: 0,
                                      right: 4,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.primaryColor,
                                        ),
                                        padding: const EdgeInsets.all(6),
                                        child: Icon(
                                          LucideIcons.camera,
                                          size: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 16),

                                // Name
                                Text(
                                  'Aiony Haust',
                                  style:
                                      AppStyles.mediumBlackBoldTitleFontStyle,
                                ),

                                // Job Title
                                Text(
                                  'Software Developer',
                                  style:
                                      AppStyles.mediumBlackNormalTitleFontStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),

              // Personal Information
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ShadCard(
                  child: Column(
                    spacing: 15,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 10,
                            children: [
                              Icon(
                                LucideIcons.user,
                                size: 20,
                                color: AppColors.primaryColor,
                              ),
                              Text(
                                "Personal Information",
                                style: AppStyles.mediumBlackBoldTitleFontStyle,
                              ),
                            ],
                          ),

                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isPersonalInfoEditable =
                                    !isPersonalInfoEditable;
                              });
                            },
                            child: Visibility(
                              visible: !isPersonalInfoEditable,
                              child: Icon(LucideIcons.pencil, size: 16),
                            ),
                          ),
                        ],
                      ),

                      !isPersonalInfoEditable
                          ? Column(
                              spacing: 10,
                              children: [
                                // Email Address
                                Row(
                                  spacing: 12,
                                  children: [
                                    Icon(LucideIcons.mail, size: 18),
                                    Text(
                                      "haust.aiony@company.com",
                                      style: AppStyles
                                          .mediumBlackNormalTitleFontStyle,
                                    ),
                                  ],
                                ),

                                // Contact Number
                                Row(
                                  spacing: 12,
                                  children: [
                                    Icon(LucideIcons.phone, size: 18),
                                    Text(
                                      "+8801818 112233",
                                      style: AppStyles
                                          .mediumBlackNormalTitleFontStyle,
                                    ),
                                  ],
                                ),

                                // Address
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 12,
                                  children: [
                                    Icon(LucideIcons.mapPin, size: 18),
                                    Expanded(
                                      child: Text(
                                        "XYZ Address, XYZ Area, XPZ postal area, xyz house no, country.",
                                        style: AppStyles
                                            .mediumBlackNormalTitleFontStyle,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          :
                            // Editable Mode of Personal Information
                            Column(
                              spacing: 10,
                              children: [
                                // Full Name Input Field
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Full Name",
                                      style: AppStyles
                                          .mediumBlackBoldTitleFontStyle,
                                    ),

                                    ShadInputFormField(
                                      // controller: emailController,
                                      placeholder: Text('Your Full Name'),
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                  ],
                                ),

                                // Contact Number Input Field
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Contact Number",
                                      style: AppStyles
                                          .mediumBlackBoldTitleFontStyle,
                                    ),

                                    ShadInputFormField(
                                      // controller: emailController,
                                      placeholder: Text('Your Contact Number'),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ],
                                ),

                                // Address Input Field
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Address",
                                      style: AppStyles
                                          .mediumBlackBoldTitleFontStyle,
                                    ),

                                    ShadTextarea(
                                      // controller: emailController,
                                      placeholder: Text('Your Address'),
                                    ),
                                  ],
                                ),

                                // Linked In URL Input Field
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "LinkedIn URL",
                                      style: AppStyles
                                          .mediumBlackBoldTitleFontStyle,
                                    ),

                                    ShadInputFormField(
                                      // controller: emailController,
                                      placeholder: Text('Your Address'),
                                    ),
                                  ],
                                ),

                                // Submit and Cancel Buttons
                                Row(
                                  spacing: 12,
                                  children: [
                                    Expanded(
                                      child: CustomButtonWidget(
                                        buttonTitle: "Save Changes",

                                        buttonBackground:
                                            AppColors.primaryColor,
                                        onTap: () {},
                                      ),
                                    ),

                                    Expanded(
                                      child: ShadButton.outline(
                                        child: Text(
                                          "Cancel",
                                          style: AppStyles
                                              .mediumBlackBoldTitleFontStyle,
                                        ),

                                        onPressed: () {
                                          setState(() {
                                            isPersonalInfoEditable = false;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 15),

              // Professional Details
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ShadCard(
                  child: Column(
                    spacing: 15,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 10,
                            children: [
                              Icon(
                                LucideIcons.info,
                                size: 20,
                                color: AppColors.primaryColor,
                              ),
                              Text(
                                "Professional Details",
                                style: AppStyles.mediumBlackBoldTitleFontStyle,
                              ),
                            ],
                          ),

                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isProfessionalDetailsEditable = true;
                              });
                            },
                            child: Visibility(
                              visible: !isProfessionalDetailsEditable,
                              child: Icon(LucideIcons.pencil, size: 16),
                            ),
                          ),
                        ],
                      ),

                      !isProfessionalDetailsEditable
                          ? Column(
                              spacing: 10,
                              children: [
                                // Email Address
                                Row(
                                  spacing: 12,
                                  children: [
                                    Icon(LucideIcons.award, size: 18),
                                    Text(
                                      "Software Developer",
                                      style: AppStyles
                                          .mediumBlackNormalTitleFontStyle,
                                    ),
                                  ],
                                ),

                                // Contact Number
                                Row(
                                  spacing: 12,
                                  children: [
                                    Icon(LucideIcons.building, size: 18),
                                    Text(
                                      "Engineering",
                                      style: AppStyles
                                          .mediumBlackNormalTitleFontStyle,
                                    ),
                                  ],
                                ),

                                // Contact Number
                                Row(
                                  spacing: 12,
                                  children: [
                                    Icon(LucideIcons.userCheck, size: 18),
                                    Text(
                                      "Anthony Albatros",
                                      style: AppStyles
                                          .mediumBlackNormalTitleFontStyle,
                                    ),
                                  ],
                                ),

                                // Address
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 12,
                                  children: [
                                    Icon(LucideIcons.calendar, size: 18),
                                    Expanded(
                                      child: Text(
                                        "Joined: 11-12-2000",
                                        style: AppStyles
                                            .mediumBlackNormalTitleFontStyle,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          :
                            // Editable Mode of Personal Information
                            Column(
                              spacing: 10,
                              children: [
                                // Employee Id Input Field
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Employee Id",
                                      style: AppStyles
                                          .mediumBlackBoldTitleFontStyle,
                                    ),

                                    ShadInputFormField(
                                      // controller: emailController,
                                      placeholder: Text('Your Employee Id'),
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                  ],
                                ),
                                // Designation Input Field
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Designation",
                                      style: AppStyles
                                          .mediumBlackBoldTitleFontStyle,
                                    ),

                                    ShadInputFormField(
                                      // controller: emailController,
                                      placeholder: Text('Your Designation'),
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                  ],
                                ),

                                // Department Dropdown
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Department",
                                      style: AppStyles
                                          .mediumBlackBoldTitleFontStyle,
                                    ),

                                    ShadSelectFormField<String>(
                                      id: 'department',
                                      minWidth: 350,
                                      initialValue: null,
                                      options: departmentList
                                          .map(
                                            (department) => ShadOption(
                                              value: department,
                                              child: Text(department),
                                            ),
                                          )
                                          .toList(),
                                      selectedOptionBuilder: (context, value) =>
                                          value == 'none'
                                          ? const Text(
                                              'Select a verified department',
                                            )
                                          : Text(value),
                                      placeholder: const Text(
                                        'Select your department',
                                      ),
                                      validator: (v) {
                                        if (v == null) {
                                          return 'Please select a department to display';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),

                                // Joining date Input Field
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Joining Date",
                                      style: AppStyles
                                          .mediumBlackBoldTitleFontStyle,
                                    ),

                                    ConstrainedBox(
                                      constraints: const BoxConstraints(
                                        minWidth: 600,
                                      ),
                                      child: const ShadDatePicker(),
                                    ),
                                  ],
                                ),

                                // Line Manager Dropdown
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Line Manager",
                                      style: AppStyles
                                          .mediumBlackBoldTitleFontStyle,
                                    ),

                                    ShadSelectFormField<String>(
                                      id: 'manager',
                                      minWidth: 350,
                                      initialValue: null,
                                      options: managerList
                                          .map(
                                            (manager) => ShadOption(
                                              value: manager,
                                              child: Text(manager),
                                            ),
                                          )
                                          .toList(),
                                      selectedOptionBuilder: (context, value) =>
                                          value == 'none'
                                          ? const Text(
                                              'Select a verified manager',
                                            )
                                          : Text(value),
                                      placeholder: const Text(
                                        'Select your Line Manager',
                                      ),
                                      validator: (v) {
                                        if (v == null) {
                                          return 'Please select a manager to display';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),

                                // Submit and Cancel Buttons
                                Row(
                                  spacing: 12,
                                  children: [
                                    Expanded(
                                      child: CustomButtonWidget(
                                        buttonTitle: "Save Changes",

                                        buttonBackground:
                                            AppColors.primaryColor,
                                        onTap: () {},
                                      ),
                                    ),

                                    Expanded(
                                      child: ShadButton.outline(
                                        child: Text(
                                          "Cancel",
                                          style: AppStyles
                                              .mediumBlackBoldTitleFontStyle,
                                        ),

                                        onPressed: () {
                                          setState(() {
                                            isProfessionalDetailsEditable =
                                                false;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 15),

              // Add Emergency Contact
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ShadCard(
                  child: Column(
                    spacing: 15,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 10,
                            children: [
                              Icon(
                                LucideIcons.users,
                                size: 20,
                                color: AppColors.primaryColor,
                              ),
                              Text(
                                "Emergency Contact",
                                style: AppStyles.mediumBlackBoldTitleFontStyle,
                              ),
                            ],
                          ),

                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isEmergencyContactEditable = true;
                              });
                            },
                            child: Visibility(
                              visible: !isEmergencyContactEditable,
                              child: Icon(LucideIcons.plus, size: 16),
                            ),
                          ),
                        ],
                      ),

                      !isEmergencyContactEditable
                          ? Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Add Emergency Contact Details",
                                style: AppStyles.smallBlackNormalTitleFontStyle,
                              ),
                            )
                          :
                            // Editable Mode of Emergency COntact
                            Column(
                              spacing: 10,
                              children: [
                                // Full Name Input Field
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Full Name",
                                      style: AppStyles
                                          .mediumBlackBoldTitleFontStyle,
                                    ),

                                    ShadInputFormField(
                                      // controller: emailController,
                                      placeholder: Text(
                                        'Full Name of the Emergency Contact',
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                  ],
                                ),

                                // Contact Number Input Field
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Contact Number",
                                      style: AppStyles
                                          .mediumBlackBoldTitleFontStyle,
                                    ),

                                    ShadInputFormField(
                                      // controller: emailController,
                                      placeholder: Text('Contact Number'),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ],
                                ),

                                // Address Input Field
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Address",
                                      style: AppStyles
                                          .mediumBlackBoldTitleFontStyle,
                                    ),

                                    ShadTextarea(
                                      // controller: emailController,
                                      placeholder: Text(
                                        'Address of the Emergency Contact',
                                      ),
                                    ),
                                  ],
                                ),

                                // Linked In URL Input Field
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Relation",
                                      style: AppStyles
                                          .mediumBlackBoldTitleFontStyle,
                                    ),

                                    ShadInputFormField(
                                      // controller: emailController,
                                      placeholder: Text(
                                        'e.g Siblings, Father, etc',
                                      ),
                                    ),
                                  ],
                                ),

                                // Submit and Cancel Buttons
                                Row(
                                  spacing: 12,
                                  children: [
                                    Expanded(
                                      child: CustomButtonWidget(
                                        buttonTitle: "Save Changes",

                                        buttonBackground:
                                            AppColors.primaryColor,
                                        onTap: () {},
                                      ),
                                    ),

                                    Expanded(
                                      child: ShadButton.outline(
                                        child: Text(
                                          "Cancel",
                                          style: AppStyles
                                              .mediumBlackBoldTitleFontStyle,
                                        ),

                                        onPressed: () {
                                          setState(() {
                                            isEmergencyContactEditable = false;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 15),

              // Skills and Experties
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ShadCard(
                  child: Column(
                    spacing: 15,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 10,
                            children: [
                              Icon(
                                LucideIcons.star,
                                size: 20,
                                color: AppColors.primaryColor,
                              ),
                              Text(
                                "Skills and Expertise",
                                style: AppStyles.mediumBlackBoldTitleFontStyle,
                              ),
                            ],
                          ),

                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSkillsExpertiseEditable = true;
                              });
                            },
                            child: Visibility(
                              visible: !isSkillsExpertiseEditable,
                              child: Icon(LucideIcons.plus, size: 16),
                            ),
                          ),
                        ],
                      ),

                      !isSkillsExpertiseEditable
                          ? Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Add your skills and expertise",
                                style: AppStyles.smallBlackNormalTitleFontStyle,
                              ),
                            )
                          :
                            // Editable Mode of Skills and Expertise
                            Column(
                              spacing: 10,
                              children: [
                                // Full Name Input Field
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Your Skills",
                                      style: AppStyles
                                          .mediumBlackBoldTitleFontStyle,
                                    ),

                                    ShadInputFormField(
                                      // controller: emailController,
                                      placeholder: Text('Yours Skills'),
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                    ShadInputFormField(
                                      // controller: emailController,
                                      placeholder: Text('Yours Skills'),
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                    ShadInputFormField(
                                      // controller: emailController,
                                      placeholder: Text('Yours Skills'),
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                  ],
                                ),

                                // Submit and Cancel Buttons
                                Row(
                                  spacing: 12,
                                  children: [
                                    Expanded(
                                      child: CustomButtonWidget(
                                        buttonTitle: "Save Changes",

                                        buttonBackground:
                                            AppColors.primaryColor,
                                        onTap: () {},
                                      ),
                                    ),

                                    Expanded(
                                      child: ShadButton.outline(
                                        child: Text(
                                          "Cancel",
                                          style: AppStyles
                                              .mediumBlackBoldTitleFontStyle,
                                        ),

                                        onPressed: () {
                                          setState(() {
                                            isSkillsExpertiseEditable = false;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 15),

              // Bank Account Information
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ShadCard(
                  child: Column(
                    spacing: 15,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 10,
                            children: [
                              Icon(
                                LucideIcons.creditCard,
                                size: 20,
                                color: AppColors.primaryColor,
                              ),
                              Text(
                                "Bank Account Information",
                                style: AppStyles.mediumBlackBoldTitleFontStyle,
                              ),
                            ],
                          ),

                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isBankAccountEditable = true;
                              });
                            },
                            child: Visibility(
                              visible: !isBankAccountEditable,
                              child: Icon(LucideIcons.plus, size: 16),
                            ),
                          ),
                        ],
                      ),

                      !isBankAccountEditable
                          ? Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Add your skills and expertise",
                                style: AppStyles.smallBlackNormalTitleFontStyle,
                              ),
                            )
                          :
                            // Editable Mode of Skills and Expertise
                            Column(
                              spacing: 10,
                              children: [
                                // Full Name Input Field
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Account Name",
                                      style: AppStyles
                                          .mediumBlackBoldTitleFontStyle,
                                    ),

                                    ShadInputFormField(
                                      // controller: emailController,
                                      placeholder: Text('Account Name'),
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                    Text(
                                      "Account Number",
                                      style: AppStyles
                                          .mediumBlackBoldTitleFontStyle,
                                    ),
                                    ShadInputFormField(
                                      // controller: emailController,
                                      placeholder: Text('Account Number'),
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                    Text(
                                      "Branch Name",
                                      style: AppStyles
                                          .mediumBlackBoldTitleFontStyle,
                                    ),
                                    ShadInputFormField(
                                      // controller: emailController,
                                      placeholder: Text('Branch'),
                                      keyboardType: TextInputType.emailAddress,
                                    ),

                                    // Routing
                                    Text(
                                      "Routing Number",
                                      style: AppStyles
                                          .mediumBlackBoldTitleFontStyle,
                                    ),
                                    ShadInputFormField(
                                      // controller: emailController,
                                      placeholder: Text('Routing Number'),
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                  ],
                                ),

                                // Submit and Cancel Buttons
                                Row(
                                  spacing: 12,
                                  children: [
                                    Expanded(
                                      child: CustomButtonWidget(
                                        buttonTitle: "Save Changes",

                                        buttonBackground:
                                            AppColors.primaryColor,
                                        onTap: () {},
                                      ),
                                    ),

                                    Expanded(
                                      child: ShadButton.outline(
                                        child: Text(
                                          "Cancel",
                                          style: AppStyles
                                              .mediumBlackBoldTitleFontStyle,
                                        ),

                                        onPressed: () {
                                          setState(() {
                                            isBankAccountEditable = false;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 15),

              // Educational Information
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ShadCard(
                  child: Column(
                    spacing: 15,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 10,
                            children: [
                              Icon(
                                LucideIcons.graduationCap,
                                size: 20,
                                color: AppColors.primaryColor,
                              ),
                              Text(
                                "Education",
                                style: AppStyles.mediumBlackBoldTitleFontStyle,
                              ),
                            ],
                          ),

                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isEducationEditable = true;
                              });
                            },
                            child: Visibility(
                              visible: !isEducationEditable,
                              child: Icon(LucideIcons.plus, size: 16),
                            ),
                          ),
                        ],
                      ),

                      !isEducationEditable
                          ? Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Add your Educational Background",
                                style: AppStyles.smallBlackNormalTitleFontStyle,
                              ),
                            )
                          :
                            // Editable Mode of Skills and Expertise
                            Column(
                              spacing: 10,
                              children: [
                                // Full Name Input Field
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Institution Name",
                                      style: AppStyles
                                          .mediumBlackBoldTitleFontStyle,
                                    ),

                                    ShadInputFormField(
                                      // controller: emailController,
                                      placeholder: Text('Institution Name'),
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                    Text(
                                      "Degree Name",
                                      style: AppStyles
                                          .mediumBlackBoldTitleFontStyle,
                                    ),
                                    ShadInputFormField(
                                      // controller: emailController,
                                      placeholder: Text('Degree Name'),
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                    Text(
                                      "Passing Year",
                                      style: AppStyles
                                          .mediumBlackBoldTitleFontStyle,
                                    ),
                                    ShadInputFormField(
                                      // controller: emailController,
                                      placeholder: Text('Passing Year'),
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                  ],
                                ),

                                // Submit and Cancel Buttons
                                Row(
                                  spacing: 12,
                                  children: [
                                    Expanded(
                                      child: CustomButtonWidget(
                                        buttonTitle: "Save Changes",

                                        buttonBackground:
                                            AppColors.primaryColor,
                                        onTap: () {},
                                      ),
                                    ),

                                    Expanded(
                                      child: ShadButton.outline(
                                        child: Text(
                                          "Cancel",
                                          style: AppStyles
                                              .mediumBlackBoldTitleFontStyle,
                                        ),

                                        onPressed: () {
                                          setState(() {
                                            isEducationEditable = false;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
