import 'package:converter/themes/colors.dart';
import 'package:flutter/material.dart';

class StyledDropdown<T> extends StatelessWidget {
  const StyledDropdown({
    super.key,
    required this.label,
    required this.initialSelection,
    required this.controller,
    required this.dropdownMenuEntries,
  });

  final Widget label;
  final T initialSelection;
  final TextEditingController controller;
  final List<DropdownMenuEntry<T>> dropdownMenuEntries;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      label: label,
      // dropdown items bg color
      menuStyle: MenuStyle(
        backgroundColor: WidgetStateProperty.resolveWith((states) => Colors.white),
      ),
      initialSelection: initialSelection,
      controller: controller,
      requestFocusOnTap: true,
      dropdownMenuEntries: dropdownMenuEntries,
      // dropdown border color
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black45,),),
      ),
    );
  }
}

