import 'package:converter/themes/colors.dart';
import 'package:flutter/material.dart';

class StyledDropdownBtn extends StatefulWidget {
  const StyledDropdownBtn({
    super.key,
    required this.dropdownList,
    required this.onChanged,
  });

  final List<String> dropdownList;
  final ValueChanged<String> onChanged;

  @override
  State<StyledDropdownBtn> createState() => _StyledDropdownBtnState();
}

class _StyledDropdownBtnState extends State<StyledDropdownBtn> {
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.dropdownList.first;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down_outlined),
      elevation: 16,
      style:  TextStyle(color: AppColors.dimmedBlack),
      dropdownColor: Colors.white,
      underline: Container(
        height: 2,
        color: Theme.of(context).primaryColor,
      ),
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() {
            dropdownValue = newValue;
          });
          widget.onChanged(newValue);
        }
      },
      items: widget.dropdownList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
