import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:odc/controller/web_service/api.dart';

import '../../../../model/reset_model.dart';
import '../../../web_service/end_point.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {

  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  static ForgetPasswordCubit get(context) => BlocProvider.of(context);
  bool swap = false;
  bool swap2 = false;

  ResetPassword ? resetPassword;
  ResetPassword ? verifyEmail;
  ResetPassword ? newPassword;
  String ?email;
  String ?otp;
  String ?password;
  void changeFunction(){
    swap = !swap;
    emit(VisibilityState());
  }
  void changeFunction2(){
    swap2 = !swap2;
    emit(VisibilityState());
  }
  Future<void> sendMessageToEmail({
    required String email
  })
  async{
    await DioHelper.postData(endPoint: FORGETPASSWORD
      ,dataPost: {
      "email" : email
        },

    ).then((value) {
      print(value!.data);
      resetPassword = ResetPassword.fromJson(value.data);
      emit(ForgetPasswordSuccessful());
    }).catchError((error){

      print(error.toString());
      emit(ForgetPasswordError());

    });
  }
  Future<void> verifyYourEmail({
    required String email,
    required String OTP,
  })
  async{
    await DioHelper.postData(endPoint: verifyOtp
      ,dataPost: {
        "email" : email,
        'otp':OTP
      },

    ).then((value) {
      print(value!.data);
      verifyEmail = ResetPassword.fromJson(value.data);
      emit(ForgetPasswordSuccessful());
    }).catchError((error){

      print(error.toString());
      emit(ForgetPasswordError());

    });
  }
  Future<void> resetNewPassword({
    required String email,
    required String OTP,
    required String password,
  })
  async{
    await DioHelper.postData(endPoint: createNewPassword
      ,dataPost: {
        "email" : email,
        'otp':OTP,
        'password':password
      },

    ).then((value) {
      print(value!.data);
      newPassword = ResetPassword.fromJson(value.data);
      emit(ForgetPasswordSuccessful());
    }).catchError((error){

      print(error.toString());
      emit(ForgetPasswordError());

    });
  }

}

