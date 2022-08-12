import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/controller/shared/bloc/cubit_home_page/home_page_cubit.dart';
import 'package:odc/view/constant/design.dart';

import '../../constant/componats.dart';
import '../../resource/color_manager.dart';
import '../../resource/route_manager.dart';
import '../../resource/style_manager.dart';
import '../../resource/text_manager.dart';
import '../../resource/value_manager.dart';

class SeeAllCourses extends StatelessWidget {

  const SeeAllCourses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var cubit = HomePageCubit.get(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          TextManager.newCourses,
          style: getBoldStyle(color: Colors.black, fontSize: AppSize.s18),
        ),
      ),
      body: SizedBox(
        width: width,
        child: Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: ListView.separated(itemBuilder: (context, index) {
              return builditemCategoryById(
                width: width,
                height: height,
                image: cubit.allCourses!.data![index].image_url
                    .toString(),
                title: cubit.allCourses!.data![index].courseName
                    .toString(),
                function: () {
                  Navigator.pushNamed(context, Routes.couresdetails ,
                      arguments: CourseDetail(
                          function: (){

                          },
                          image: cubit.allCourses!.data![index].image_url,
                          title: cubit.allCourses!.data![index].courseName,
                          location: 'cairo',
                          level: cubit.allCourses!.data![index].courseLevel,
                          subTitle: cubit.allCourses!.data![index].admin?.adminName

                      )
                  );

                },
                admin: cubit.allCourses!.data![index].admin!.adminName
                    .toString(),
              );
            },
                separatorBuilder: (context, index) {
                  return Divider(
                    thickness: 1,
                  );
                },
                itemCount: cubit.allCourses!.data!.length)
        ),
      ),

    );
  }

}