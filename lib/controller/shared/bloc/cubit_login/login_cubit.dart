import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:odc/controller/web_service/api.dart';
import 'package:odc/model/login_model.dart';

import '../../../web_service/end_point.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) =>BlocProvider.of(context);
  LoginModel? loginModel;
  bool swap  = false;
  void changeFunction(){
    swap = !swap;
    emit(VisibilityState());
  }
  Future<void> login({
    required String email,
    required String password
  }) async
  {
    emit(LoadingState());
    await DioHelper.postData(
        endPoint: LOGIN,
      dataPost: {
      'email' : email,
      'password':password
      }
    ).then((value) {
      print(value);
      loginModel = LoginModel.fromJson(value!.data);
      emit(LoginStateSuccessful());
    }).catchError((error){
      print(error);
      emit(LoginStateError());
    });
  }



}
