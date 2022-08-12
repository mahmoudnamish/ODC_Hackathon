import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:odc/controller/shared/bloc/cubit_enroll_exam/exam_cubit.dart';
import 'package:odc/controller/shared/bloc/cubit_login/login_cubit.dart';
import 'package:odc/controller/shared/bloc/cubit_onBoarding_screen/on_boarding_cubit.dart';
import 'package:odc/controller/shared/bloc/cubit_regiser/register_cubit.dart';
import 'package:odc/controller/web_service/end_point.dart';
import 'package:odc/view/constant/getCacheData.dart';
import 'package:odc/view/resource/color_manager.dart';
import 'package:odc/view/resource/route_manager.dart';
import 'package:odc/view/resource/theme_manager.dart';
import 'controller/shared/bloc/bloc_ob_server.dart';
import 'controller/shared/bloc/cubit_forget_password/forget_password_cubit.dart';
import 'controller/shared/bloc/cubit_home_page/home_page_cubit.dart';
import 'controller/shared/bloc/cubit_profile/profile_cubit.dart';
import 'controller/shared/shared_prefrance/sheard_perafrance.dart';
import 'controller/web_service/api.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.init() ;

  DioHelper(baseUrl);

  BlocOverrides.runZoned(
        () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(

        providers: [
          BlocProvider<ForgetPasswordCubit>(
            create: (BuildContext context) => ForgetPasswordCubit(),

          ),
          BlocProvider<LoginCubit>(
            create: (BuildContext context) => LoginCubit(),
          ),
          BlocProvider<RegisterCubit>(
            create: (BuildContext context) => RegisterCubit(),

          ),
          BlocProvider<OnBoardingCubit>(
            create: (BuildContext context) => OnBoardingCubit(),

          ),



          BlocProvider<ExamCubit>(
            create: (BuildContext context) =>   ExamCubit(),

          ),

          // BlocProvider<ForgetPasswordCubit>(
          //   create: (BuildContext context) => ForgetPasswordCubit(),
          //
          // ),

        ],
        child:GlobalLoaderOverlay(

              useDefaultLoading: false,
              overlayWidget: const Center(
                child: SpinKitCubeGrid(
                  color: ColorManager.primary,
                  size: 50.0,

              ),
              ),
          child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: getApplicationTheme(),
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: Routes.onBoardingRoute,
      ),
        ),
    );
  }
}

