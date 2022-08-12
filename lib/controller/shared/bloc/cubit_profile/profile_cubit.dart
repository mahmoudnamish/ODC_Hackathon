import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:odc/controller/web_service/api.dart';
import 'package:odc/view/constant/getCacheData.dart';

import '../../../../model/get_categories_id_Model.dart';
import '../../../../model/profile.dart';
import '../../../web_service/end_point.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get(context)=> BlocProvider.of(context);
  Profile ? profile;
  GetCategoryId ? getCategoryId;

  Future<void> getProfileData() async {
    await DioHelper.getData(
      token: GetCacheData().token,
        endPoint:profileEndPoint
    ).then((value) {
      profile = Profile.fromJson(value!.data);
      emit(ProfileSuccessful());
    });
  }
  Future<void> getAllCategoryId({required String token ,required int id ,

  }) async{
    await DioHelper.getData(
        token: token,
        //   query: {
        //   'categoryId' :1,
        // },
        endPoint:'categories/$id/courses'
    ).then((value) {
      getCategoryId = GetCategoryId.fromJson(value!.data);
      print(getCategoryId!.data!.courses![0].courseName);
    });
  }
}
