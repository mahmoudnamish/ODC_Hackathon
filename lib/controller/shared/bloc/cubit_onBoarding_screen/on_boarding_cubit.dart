import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../view/resource/assets_manager.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());
  static OnBoardingCubit get(context) => BlocProvider.of(context);

  List<String>onBoardingImage = [
    ImageAssets.onBoardingLogo1,
    ImageAssets.onBoardingLogo2,
    ImageAssets.onBoardingLogo3,
  ];

}
