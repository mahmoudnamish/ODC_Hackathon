import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resource/assets_manager.dart';
import '../resource/color_manager.dart';
import '../resource/style_manager.dart';
import '../resource/value_manager.dart';
import 'design.dart';
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
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text("Learn UI/UX for beginners" ,style: getBoldStyle(color: ColorManager.headTextColor ,fontSize: AppSize.s18),),
                  Text("Achieved April 21 2022" ,style: getSemiBoldStyle(color: ColorManager.disableTextColor ),)

                ],
              ),
            )

          ],
        )
    );
  }
}
class CategoriesDesign extends StatelessWidget {
  String ? title;
  String ? imagePath;
  Function ?function;
  CategoriesDesign({Key? key,
    required this.title,
    required this.imagePath,
    required this.function,
  }) : super(key: key) ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        function!();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: AppPadding.p14),
            child: Container(
              width: 73,
              height: 73,
              decoration:BoxDecoration(
                color: ColorManager.bacGroundCategory,
                borderRadius: BorderRadius.circular(AppSize.s14),
                boxShadow:  const [
                  BoxShadow(
                    color: ColorManager.shadowCategory,
                    blurRadius: 2,
                    offset: Offset(0, 1), // Shadow position
                  ),
                ],
              ),
              child: Image(
                image: NetworkImage(imagePath ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Orange_logo.svg/1200px-Orange_logo.svg.png" ,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 65,
            child: Text(title ?? "Error",style:getSemiBoldStyle(color: ColorManager.headTextColor ,
            ),
              textAlign: TextAlign.center
              ,),
          )
        ],
      ),
    );
  }
}
class NewCourseDesign extends StatelessWidget {
  String? image;
  String? title;
  String? category;
  String? admin;
  String? hours;
  final double width;
  final double height;
  final Function function;

  NewCourseDesign({
    Key? key,
    required this.width,
    required this.height,
    this.image =
    'https://www.ngmisr.com/wp-content/uploads/2021/11/istockphoto-1208175333-612x612-7.jpg',
    required this.category,
    required this.title,
    required this.hours,
    required this.admin,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        function();
      },
      child: SizedBox(
        width: width * .5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.s18),
              child:  Image(
                image: NetworkImage(image! ),

                height: height*.2,

              ),

            ),
            SizedBox(
              height: height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.only(left: AppPadding.p8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category!,
                    style: getSemiBoldStyle(color: ColorManager.primary),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  SizedBox(
                    width: width * .4,
                    child: Text(
                      title!,
                      style: getBoldStyle(
                          color: ColorManager.headTextColor,
                          fontSize: AppSize.s18),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: width * .45,
                        child: Text(
                          "$admin . $hours Hours",
                          style: getBoldStyle(color: ColorManager.textAdminColor),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}
GestureDetector builditemCategoryById(
    {
      required double width, required double height ,
      required Function function,
      required String image,
      required String title,
      required String admin
    }) {
  return GestureDetector(
    onTap: (){
      function();
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(AppSize.s18),
          child:  Image(
            image: NetworkImage(image ),
            width: width*.4,
          ),
        ),
        SizedBox(
            width: width*.05
        ),
        SizedBox(
          width: width * .45,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${title} ",
                style: getBoldStyle(color: ColorManager.headTextColor ,fontSize: AppSize.s18 ,

                ),
              ),
              SizedBox(
                  height: height*.02
              ),
              Text(
                "${ admin} . 14 Hours",
                style: getBoldStyle(color: ColorManager.textAdminColor),
              ),
            ],
          ),
        )


      ],
    ),
  );
}
class CourseDetail{
  String ? image;
  String ? title;
  String ? subTitle;
  Function ? function;
  String ? level;
  String ?location ;

  CourseDetail({
    this.image,
    this.title,
    this.subTitle,
    this.function,
    this.level,
    this.location,
  });
}

