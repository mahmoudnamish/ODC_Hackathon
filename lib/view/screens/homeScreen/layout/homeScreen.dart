import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter_svg/svg.dart';


import '../../../../controller/shared/bloc/cubit_home_page/home_page_cubit.dart';
import '../../../constant/getCacheData.dart';
import '../../../resource/assets_manager.dart';
import '../../../resource/color_manager.dart';
class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
  int index = 1;
  List<DotNavigationBarItem>bottomNavigationItems (context){
    return [
      DotNavigationBarItem(
        icon: SvgPicture.asset(ImageAssets.homeIcon,
            color:(HomePageCubit.get(context).defaultIndex ==0 ) ? ColorManager.primary : null
        ),
        selectedColor: ColorManager.primary,
      ),

      DotNavigationBarItem(
        icon: SvgPicture.asset(ImageAssets.myCourse ,
            color:(HomePageCubit.get(context).defaultIndex ==1 ) ? ColorManager.primary : null

        ),
        selectedColor: ColorManager.primary,
      ),

      DotNavigationBarItem(
        icon: SvgPicture.asset(ImageAssets.profile,
            color:(HomePageCubit.get(context).defaultIndex ==2 ) ? ColorManager.primary : null

        ),
        selectedColor: ColorManager.primary,
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomePageCubit>(
  create: (context) =>    HomePageCubit()..getAllCategory()..getAllCourses()..getProfileData(GetCacheData().token)
      ,
  child: BlocConsumer<HomePageCubit,HomePageState>(
      listener: (context, state) {

      },
      builder: (context,state){
        return Scaffold(
          body: SafeArea(
            child: HomePageCubit.get(context).screen[HomePageCubit.get(context).defaultIndex],
          ),
          bottomNavigationBar:  DotNavigationBar(

            selectedItemColor: ColorManager.primary,
            currentIndex: HomePageCubit.get(context).defaultIndex,
            onTap: (index){
              HomePageCubit.get(context).changeIndex(index);
            },

            dotIndicatorColor: ColorManager.primary,
            items: bottomNavigationItems(context)
          ),

        );
      },

    ),
);
  }
}
