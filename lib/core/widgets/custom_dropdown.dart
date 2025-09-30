import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CustomDropdown extends StatelessWidget {
  final List itemList;
  final String hintText;
  const CustomDropdown({
    super.key,
    required this.itemList,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return ShadSelectFormField<String>(
      id: hintText,
      minWidth: 350,
      initialValue: null,
      options: itemList
          .map((value) => ShadOption(value: value, child: Text(value)))
          .toList(),
      selectedOptionBuilder: (context, value) =>
          value == 'none' ? Text('Select a verified $hintText') : Text(value),
      placeholder: Text('Select your $hintText'),
      validator: (v) {
        if (v == null) {
          return 'Please select a $hintText to display';
        }
        return null;
      },
    );
  }
}
