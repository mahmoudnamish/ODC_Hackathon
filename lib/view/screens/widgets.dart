import 'package:flutter/material.dart';

import '../resource/color_manager.dart';
import '../resource/style_manager.dart';
import '../resource/value_manager.dart';
class CustomButton extends StatelessWidget {
  Function function;
  String text;
  double  withSize = 150;
  double  heightSize = 50;
  CustomButton({Key? key, required this.function, required this.text , this.withSize = 150 ,  this.heightSize = 50 });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          function();
        },
        style: ElevatedButton.styleFrom(
          fixedSize:  Size(withSize, heightSize),
          primary: Colors.transparent,
          shadowColor: Colors.transparent.withOpacity(0.1),
          side: const BorderSide(
            width: 2,
            color: ColorManager.primary,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s8)),
        ),
        child: Text(
          text,
          style: getSemiBoldStyle(
              color: ColorManager.primary, fontSize: AppSize.s12),
        ));
  }
}