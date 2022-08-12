import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:odc/view/screens/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../controller/shared/bloc/cubit_onBoarding_screen/on_boarding_cubit.dart';
import '../resource/color_manager.dart';
import '../resource/route_manager.dart';
import '../resource/style_manager.dart';
import '../resource/text_manager.dart';
import '../resource/value_manager.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    var cubit = OnBoardingCubit.get(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .4,
              child: PageView.builder(
                itemBuilder: (context, index) {
                  return SvgPicture.asset(
                    cubit.onBoardingImage[index],
                  );
                },
                controller: _controller,
                itemCount: cubit.onBoardingImage.length,
                physics: BouncingScrollPhysics(),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .7,
              child: Text(
                TextManager.onBoardingTextOne,
                style: getRegularStyle(
                    fontSize: AppSize.s28, color: ColorManager.headTextColor),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .7,
              child: Text(
                TextManager.onBoardingTextTwo,
                style: getMediumStyle(
                    fontSize: AppSize.s14,
                    color: ColorManager.captionTextColor),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            SmoothPageIndicator(
              controller: _controller, // PageController
              count: cubit.onBoardingImage.length,
              effect:  const WormEffect(
                  dotColor: ColorManager.disableTextColor,
                  activeDotColor:
                      ColorManager.primary), // your preferred effect
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context, Routes.registerRoute ,(route) => false,);
                    }, child: const Text(TextManager.joinNow)),
                CustomButton(
                  function: () {
                    Navigator.pushReplacementNamed(context, Routes.loginRoute);
                  },
                  text: TextManager.logIn,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


