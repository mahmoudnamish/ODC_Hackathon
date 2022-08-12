import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../controller/shared/bloc/cubit_login/login_cubit.dart';
import '../../controller/shared/shared_prefrance/sheard_perafrance.dart';
import '../constant/design.dart';
import '../constant/validator.dart';
import '../resource/assets_manager.dart';
import '../resource/color_manager.dart';
import '../resource/fonts_manager.dart';
import '../resource/route_manager.dart';
import '../resource/style_manager.dart';
import '../resource/text_manager.dart';
import '../resource/value_manager.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var cubit = LoginCubit.get(context);

    return Scaffold(
        body: SafeArea(
            child: SizedBox(
      width: double.infinity,
      height: height,
      child: Stack(
        children: [
          upDesign(context),
          downDesign(context),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: SvgPicture.asset(
                        ImageAssets.logo,
                        height: MediaQuery.of(context).size.height * .07,
                      ),
                    ),
                    SizedBox(
                      height: height * .1,
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: SizedBox(
                        width: width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                buildTextLoginScreen(
                                    text: TextManager.welcome,
                                    fontSize: AppSize.s35,
                                    color: ColorManager.headTextColor),
                                buildTextLoginScreen(
                                    text: TextManager.back,
                                    fontSize: AppSize.s35,
                                    color: ColorManager.primary),
                              ],
                            ),
                            buildTextLoginScreen(
                                text: TextManager.logIn,
                                fontSize: AppSize.s28,
                                color: ColorManager.paragraph),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * .05,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // emailValidator
                          buildTextFormField(
                              hintText: TextManager.email,
                              controller: emailController,
                              icon: const Icon(Icons.email_outlined),
                              fieldValidator: emailValidator),

                          BlocBuilder<LoginCubit, LoginState>(
                            builder: (context, state) {
                              return buildTextFormField(
                                  hintText: TextManager.password,
                                  controller: passwordController,
                                  icon: const Icon(Icons.lock_outline_rounded),
                                  password: cubit.swap,
                                  fieldValidator: requireValidator,
                                  inputType: TextInputType.text,
                                  showPrefixIcon: true,
                                  swapPrefixIcon: cubit.swap,
                                  width: width,
                                  function: () {
                                    cubit.changeFunction();
                                  });
                            },
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: buildTextButton(
                          function: () {
                            Navigator.pushNamed(
                                context, Routes.forgetPasswordRoute);
                          },
                          text: TextManager.forgetPassword),
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          // Navigator.pushNamed(context, Routes.homeScreen);
                          if (_formKey.currentState!.validate()) {
                            onLoading(context);
                            await cubit
                                .login(
                                    email: emailController.text,
                                    password: passwordController.text)
                                .then((value) {
                              if (cubit.loginModel?.success == true) {
                                offLoading(context);

                                CacheHelper.saveData(
                                    key: 'token',
                                    value: cubit.loginModel?.data?.accessToken);
                                CacheHelper.saveData(
                                    key: 'refresh_token',
                                    value:
                                        cubit.loginModel?.data?.refreshToken);

                                Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    Routes.homeScreen,
                                    (Route<dynamic> route) => false);
                              } else {
                                offLoading(context);

                                alert(
                                    context: context,
                                    text: cubit.loginModel!.message.toString());
                              }
                            }).catchError((error) {
                              offLoading(context);

                              alert(
                                  context: context,
                                  text: cubit.loginModel!.message.toString());
                            });
                            offLoading(context);
                          }

                          // if(state is LoadingState){
                          //   context.loaderOverlay.show();
                          // }else if(state is LoginStateSuccessful){
                          //   context.loaderOverlay.show();
                          //
                          //   Navigator.pushReplacementNamed(context, Routes.loginRoute);
                          //   context.loaderOverlay.hide();
                          // }else{
                          //   context.loaderOverlay.show();
                          //   context.loaderOverlay.hide();
                        },
                        child: const Text(TextManager.logIn)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          TextManager.doNotHaveAnAccount,
                          style: getSemiBoldStyle(color: Colors.black),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, Routes.registerRoute);
                            },
                            child: const Text(
                              TextManager.signUp,
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: FontSize.s14),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.064,
          ),
        ],
      ),
    )));
  }
}
