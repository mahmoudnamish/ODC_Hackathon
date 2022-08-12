import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/controller/shared/bloc/cubit_home_page/home_page_cubit.dart';
import 'package:odc/view/constant/getCacheData.dart';

import '../../constant/componats.dart';
import '../../resource/route_manager.dart';
import '../../resource/style_manager.dart';
import '../../resource/text_manager.dart';
import '../../resource/value_manager.dart';

class seeAllPage extends StatelessWidget {
  const seeAllPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var cubit = HomePageCubit.get(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            TextManager.categories,
            style: getBoldStyle(color: Colors.black, fontSize: AppSize.s18),
          ),
        ),
        body: SizedBox(
          child:  GridView.builder(
            itemBuilder: (BuildContext context, int index) {
              return CategoriesDesign(
                title: cubit
                    .allCategory!.data![index].categoryName
                    .toString(),
                imagePath: cubit
                    .allCategory!.data![index].imageUrl
                    .toString(), function: (){
                cubit.getAllCategoryId(token: GetCacheData().token,
                    id: cubit.allCategory!.data![index].id.toString()).then((value) {
                  Navigator.pushNamed(context,Routes.specificCategory , arguments:
                  cubit.getCategoryId
                  );

                });
              },
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 20,
              childAspectRatio: 0.9 / 0.6,
            ),
            itemCount: cubit.allCategory!.data!.length,
          ),
          ),
        );

  }
}
