import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:odc/controller/shared/bloc/cubit_home_page/home_page_cubit.dart';
import 'package:odc/controller/shared/bloc/cubit_profile/profile_cubit.dart';
import 'package:odc/view/constant/design.dart';
import 'package:odc/view/constant/getCacheData.dart';
import 'package:odc/view/resource/assets_manager.dart';
import 'package:odc/view/resource/color_manager.dart';
import 'package:odc/view/resource/style_manager.dart';
import 'package:odc/view/resource/text_manager.dart';
import 'package:odc/view/resource/value_manager.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // var cubit = ProfileCubit.get(context);
    var cubitHomePage = HomePageCubit.get(context);
    return Scaffold(
        appBar: AppBar(
            titleSpacing: 0,
            title: Padding(
              padding: const EdgeInsets.only(left: AppSize.s18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    TextManager.myProfile,
                    style: getBoldStyle(
                        color: ColorManager.primary, fontSize: AppSize.s28),
                  ),
                ],
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: AppSize.s18),
                child: IconButton(
                  onPressed: ()
                  {

                    alert(context: context, text: TextManager.textONAlertLogoOut ,
                        pathImage: ImageAssets.logoutAlert,
                        title: TextManager.logOut,
                        width: width*.4,
                        hight: height*.35,
                        function: (){
                          cubitHomePage.logOut(GetCacheData().token ,context);

                        }
                    );
                  },
                  icon: SvgPicture.asset(
                    ImageAssets.logOut,
                  ),
                ),
              ),
            ]),
        body: (cubitHomePage.profile !=null)?SizedBox(
          height: height,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.04,
                ),
                const CircleAvatar(
                  backgroundColor: ColorManager.primary,
                  radius: 50,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 45,
                  ),
                ),
                SizedBox(
                  height: height * .04,
                ),
                Text(
                  cubitHomePage.profile!.data!.student!.studentName.toString(),
                  style: getBoldStyle(
                      color: ColorManager.headTextColor, fontSize: AppSize.s28),
                ),
                SizedBox(
                  height: height * .01,
                ),
                Container(
                  padding: const EdgeInsets.all(AppPadding.p14),
                  width: width * .5,
                  decoration: BoxDecoration(
                      color: ColorManager.profileEmailBackground,
                      borderRadius: BorderRadius.circular(AppSize.s12)),
                  child: Center(
                      child: Text(
                        cubitHomePage.profile!.data!.student!.email.toString(),

                        style: getBoldStyle(
                          color: ColorManager.disableTextColor,
                        ),
                      )),
                ),
                SizedBox(
                  height: height * .02,
                ),
                Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      TextManager.myAchievement,
                      style: getBoldStyle(color: ColorManager.headTextColor ,
                          fontSize: AppSize.s18),
                    )),
                SizedBox(
                  height: height * .02,
                ),
                Achievement(width: width)

              ],
            ),
          ),
        ) :const Center(
          child: CircularProgressIndicator.adaptive(),
        )
    );
  }
}

class Achievement extends StatelessWidget {
  const Achievement({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          SvgPicture.asset(
            ImageAssets.star ,
          ),
          SizedBox(
            width: width * .04,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text("Learn UI/UX for beginners" ,style: getBoldStyle(color: ColorManager.headTextColor ,fontSize: AppSize.s18),),
              Text("Achieved April 21 2022" ,style: getSemiBoldStyle(color: ColorManager.disableTextColor ),)

            ],
          )

        ],
      )
    );
  }
}
