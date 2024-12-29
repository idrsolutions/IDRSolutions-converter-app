import 'package:converter/themes/colors.dart';
import 'package:flutter/material.dart';

class OverlayProgressCircle {
  const OverlayProgressCircle();

  static OverlayEntry createOverlayProgressCircle(){
    return OverlayEntry(
      builder: (BuildContext context){
        return Center(
          child: Material(
            elevation: 4.0,
            color: Colors.transparent,
            shadowColor: Colors.transparent,
            child: CircularProgressIndicator(
              color: AppColors.dimmedBlack,
            ),
          ),
        );
      }
    );
  }
}

