import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../resource/assets_manager.dart';
import '../resource/color_manager.dart';
import '../resource/fonts_manager.dart';
import '../resource/style_manager.dart';
import '../resource/text_manager.dart';
import '../resource/value_manager.dart';
import '../screens/widgets.dart';

SizedBox downDesign(BuildContext context) {
  return SizedBox(
    width: double.infinity,
    child: Align(
        alignment: AlignmentDirectional.bottomStart,
        child: SvgPicture.asset(
          ImageAssets.loginScreenDawon,
          height: MediaQuery.of(context).size.height * .12,
        )),
  );
}

SizedBox upDesign(BuildContext context) {
  return SizedBox(
    width: double.infinity,
    child: Align(
        alignment: AlignmentDirectional.topEnd,
        child: SvgPicture.asset(
          ImageAssets.loginScreenUp,
          height: MediaQuery.of(context).size.height * .12,
        )),
  );
}

void alert(
    {required BuildContext context,
    required String text,
    String? pathImage,
    String? title,
    double ? width,
      double ?hight,
      Function ? function
    }) {
  print(hight);
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      insetPadding: EdgeInsets.zero,
      title: (title == null) ? const Text('Wrong') : Text(title),
      content: (pathImage == null)
          ? Text(
              text,
              style: getSemiBoldStyle(color: ColorManager.headTextColor),
            )
          : SizedBox(
              height: hight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SvgPicture.asset(pathImage),

                  Text(
                    text,
                    style: getSemiBoldStyle(color: ColorManager.headTextColor ,fontSize: AppSize.s14),
                  ),
                  Row(
                    children: [
                      ElevatedButton(

                          onPressed: () {
                            // Navigator.pushReplacementNamed(context, Routes.registerRoute);
                          }, child:  Text(TextManager.back),),
                      const SizedBox(
                        width: 20,
                      ),
                      CustomButton(
                      withSize: width!.toDouble(),
                        function: () {
                          function!();
                        },

                        text: TextManager.logOut,
                      )
                    ],
                  )
                ],
              ),
            ),
      actions:(imagePath ==null)?
      <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Back'),
          child: const Text('Back'),
        ),
      ] : <Widget>[]
    ),
  );
}

void onLoading(BuildContext context) {
  context.loaderOverlay.show();
}

void offLoading(BuildContext context) {
  context.loaderOverlay.hide();
}

Widget buildTextFormField(
    {required String hintText,
    required TextEditingController controller,
    required Widget icon,
    required FormFieldValidator fieldValidator,
    bool password = false,
    TextInputType inputType = TextInputType.text,
    bool showPrefixIcon = false,
    bool swapPrefixIcon = false,
    Function? function,
      Color ?color,
    var width}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: AppPadding.p14),
    child: SizedBox(
      height: 60,
      child: TextFormField(
        keyboardType: inputType,
        validator: fieldValidator,
        obscureText: password,
        controller: controller,
        style: getSemiBoldStyle(
            color: ColorManager.primary, fontSize: AppSize.s18),
        autofocus: false,
        decoration: InputDecoration(
          filled: true,
          fillColor: (color!=null) ? color:     ColorManager.backGroundField,

          isDense: true,
          suffix: (showPrefixIcon)
              ? IconButton(
                  onPressed: () {
                    function!();
                  },
                  icon: (swapPrefixIcon)
                      ? Icon(
                          Icons.visibility,
                          size: width * 0.05,
                        )
                      : Icon(
                          Icons.visibility_off,
                          size: width * 0.05,
                        ),
                )
              : const SizedBox(),
          prefixIcon: icon,
          hintText: hintText,
        ),
      ),
    ),
  );
}

Text buildTextLoginScreen(
    {required String text, required Color color, required double fontSize}) {
  return Text(
    text,
    style: getBoldStyle(color: color, fontSize: fontSize),
  );
}

TextButton buildTextButton({required String text, required Function function}) {
  return TextButton(
      onPressed: () {
        function();
      },
      child: Text(
        text,
        style: TextStyle(
            decoration: TextDecoration.underline, fontSize: FontSize.s14),
      ));
}
