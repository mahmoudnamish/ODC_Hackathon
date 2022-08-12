import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:odc/controller/web_service/api.dart';
import 'package:odc/controller/web_service/end_point.dart';

import '../../../../model/register_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) =>BlocProvider.of(context);
  bool swap = false;
  bool privacy = false;
  RegisterModel ?  registerModel;

  void changeFunction(){
    swap = !swap;
    emit(VisibilityState());
  }
  void changePrivacy(){
    privacy = !privacy;
    emit(VisibilityState());
  }
  Future<void> register({
  required String name,
    required String email,
    required String password,
    required String phone,
    required String address,
})async{

    await DioHelper.postData(
      endPoint: REGISTER,
      dataPost: {
        'name' :name,
        'email':email,
        'password':password,
        'phone':phone,
        'address':address,
      }
    ).then((value) {
      print(value!.data);
      registerModel = RegisterModel.fromJson(value.data);
      emit(AccountCreateSuccessful());
    }).catchError((e){
      print(e);
      emit(AccountCreateError());
    });
  }

}
