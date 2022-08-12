import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:odc/controller/shared/bloc/cubit_enroll_exam/exam_cubit.dart';
import 'package:odc/controller/shared/bloc/cubit_home_page/home_page_cubit.dart';
import 'package:odc/view/constant/design.dart';
import 'package:odc/view/constant/getCacheData.dart';
import 'package:odc/view/resource/color_manager.dart';
import 'package:odc/view/resource/route_manager.dart';
import 'package:odc/view/resource/style_manager.dart';
import 'package:odc/view/resource/text_manager.dart';
import '../../../constant/componats.dart';
import '../../../constant/validator.dart';
import '../../../resource/assets_manager.dart';
import '../../../resource/value_manager.dart';
import '../specific _category.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(HomePageCubit.get(context).allCategory);
    var size = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var cubitExam = ExamCubit.get(context);
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p20),
      child: SizedBox(
        width: width,
        height: height,
        child: ListView(
          children: [
            SizedBox(
              height: height * .04,
            ),
            Align(
              alignment: AlignmentDirectional.topStart,
              child: SvgPicture.asset(ImageAssets.headerLogo),
            ),
            SizedBox(
              height: height * .04,
            ),
            Container(
              width: width,
              height: height * 0.3,
              decoration: BoxDecoration(
                color: ColorManager.headTextColor,
                borderRadius: BorderRadius.circular(AppSize.s14),
                boxShadow: const [
                  BoxShadow(
                    color: ColorManager.primary,
                    blurRadius: 1,
                    offset: Offset(0, 5), // Shadow position
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: width * .6,
                      height: height * 0.12,
                      child: Text(
                        TextManager.enterTheCodeToGetCourse,
                        style: getSemiBoldStyle(
                            color: ColorManager.whiteColor,
                            fontSize: AppSize.s28),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: AppPadding.p18),
                            child: buildTextFormField(
                                hintText: TextManager.enterCode,
                                controller: codeController,
                                color: ColorManager.textFieldMainPageColor,
                                icon: const SizedBox(),
                                fieldValidator: requireValidator),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        CircleAvatar(
                          radius: AppSize.s28,
                          backgroundColor: ColorManager.primary,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                                color: ColorManager.whiteColor,
                                Icons.arrow_forward),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * .04,
            ),
            buildTwoTextWitheSpace(
                function: () {
                  Navigator.pushNamed(context, Routes.seeAllPage);
                },
                textOne: TextManager.topCategories,
                textTwo: TextManager.seeAll),
            BlocConsumer<HomePageCubit, HomePageState>(
              listener: (context, state) {},
              builder: (context, state) {
                var cubit = HomePageCubit.get(context);
                return cubit.allCategory != null
                    ? Padding(
                        padding: const EdgeInsets.all(AppPadding.p8),
                        child: SizedBox(
                          height: height * .2,
                          child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return CategoriesDesign(
                                  function: () {
                                    cubit
                                        .getAllCategoryId(
                                            token: GetCacheData().token,
                                            id: cubit
                                                .allCategory!.data![index].id
                                                .toString())
                                        .then((value) {
                                      (cubit.getCategoryId);
                                      Navigator.pushNamed(
                                          context, Routes.specificCategory ,
                                      arguments: cubit.getCategoryId
                                      );
                                    });
                                  },
                                  title: cubit
                                      .allCategory?.data![index].categoryName
                                      .toString(),
                                  imagePath: cubit
                                      .allCategory!.data![index].imageUrl
                                      .toString(),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  width: width * 0.16,
                                );
                              },
                              itemCount: 3),
                        ),
                      )
                    : const Center(child: CircularProgressIndicator.adaptive());
              },
            ),
            buildTwoTextWitheSpace(
                function: () {
                  Navigator.pushNamed(context, Routes.seeAllCourses);
                },
                textOne: TextManager.newCourses,
                textTwo: TextManager.seeAll),
            BlocConsumer<HomePageCubit, HomePageState>(
              listener: (context, state) {},
              builder: (context, state) {
                var cubit = HomePageCubit.get(context);
                return cubit.allCategory != null
                    ? SizedBox(
                        height: height * .4,
                        child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return NewCourseDesign(
                                title:
                                    cubit.allCourses!.data![index].courseName,
                                admin: cubit
                                    .allCourses!.data![index].admin?.adminName,
                                category: cubit.allCourses!.data![index]
                                    .category?.categoryName,
                                hours: '14',
                                image: cubit.allCourses!.data![index].image_url,
                                width: width,
                                height: height,
                                function: () {
                                  cubit.courseScreenDetails(
                                      context: context,
                                      image: cubit
                                          .allCourses!.data![index].image_url
                                          .toString(),
                                      title: cubit
                                          .allCourses!.data![index].courseName
                                          .toString(),
                                      level: cubit
                                          .allCourses!.data![index].courseLevel
                                          .toString(),
                                      subTitle: cubit.allCourses!.data![index]
                                          .admin!.adminName
                                          .toString(),
                                      function: () {
                                        cubitExam.enrollCourse(
                                            token: GetCacheData().token,
                                            id: cubit
                                                .allCourses!.data![index].id
                                                .toString());
                                      });
                                  // Navigator.pushNamed(context, Routes.couresdetails ,
                                  //     arguments: CourseDetail(
                                  //         function: (){},
                                  //         image: cubit.allCourses!.data![index].image_url,
                                  //         title: cubit.allCourses!.data![index].courseName,
                                  //         location: 'cairo',
                                  //         level: cubit.allCourses!.data![index].courseLevel,
                                  //         subTitle: cubit.allCourses!.data![index].admin?.adminName
                                  //
                                  //     )
                                  // );
                                },
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                width: 12,
                              );
                            },
                            itemCount: 3),
                      )
                    : const Center(child: CircularProgressIndicator.adaptive());
              },
            ),
          ],
        ),
      ),
    );
  }

  Row buildTwoTextWitheSpace({
    required Function function,
    required String textOne,
    required String textTwo,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          textOne,
          style: getSemiBoldStyle(
              color: ColorManager.headTextColor, fontSize: AppSize.s18),
        ),
        TextButton(
          onPressed: () {
            function();
          },
          child: Text(
            textTwo,
            style: TextStyle(
                decoration: TextDecoration.underline, fontSize: AppSize.s18),
          ),
        )
      ],
    );
  }
}
