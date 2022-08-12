import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:odc/controller/web_service/api.dart';

import '../../../../model/exam_model.dart';

part 'exam_state.dart';

class ExamCubit extends Cubit<ExamState> {
  ExamCubit() : super(ExamInitial());
  static ExamCubit get(context) =>  BlocProvider.of(context);

  ExamModel ? examModel;
  Future<void>enrollCourse({String? token , String ? id}) async
  {
    await DioHelper.postData(
      endPoint: '/courses/$id/enroll',
      token: token.toString(),
    ).then((value) {
      examModel = null;
      print(value!.data);
      examModel = ExamModel.fromJson(value.data);
      emit(ExamEnrolledSuccessful());
    }).catchError((error){
      if (kDebugMode) {
        print(error);
      }
      emit(ExamEnrolledError());

    });

  }
}
