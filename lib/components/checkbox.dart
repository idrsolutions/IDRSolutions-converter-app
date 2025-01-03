import 'package:flutter/material.dart';

class StyledCheckbox extends StatefulWidget {
  const StyledCheckbox({
    super.key,
    required this.isChecked,
  });

  final bool isChecked;

  @override
  State<StyledCheckbox> createState() => _StyledCheckboxState();
}

class _StyledCheckboxState extends State<StyledCheckbox> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: _isChecked, 
      onChanged: (newVal){
        setState(() {
          _isChecked = newVal!;
        });
      }
    );
  }
}