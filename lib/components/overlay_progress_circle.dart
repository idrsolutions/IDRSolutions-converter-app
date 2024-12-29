import 'package:converter/themes/colors.dart';
import 'package:flutter/material.dart';

class OverlayProgressCircle {
  const OverlayProgressCircle();

  static OverlayEntry createOverlayProgressCircle(){
    return OverlayEntry(
      builder: (BuildContext context){
        return Positioned(
          top: 100,
          child: Material(
            elevation: 4.0,
            child: CircularProgressIndicator(
              color: AppColors.dimmedBlack,
            ),
          )
        );
      }
    );
  }
}

