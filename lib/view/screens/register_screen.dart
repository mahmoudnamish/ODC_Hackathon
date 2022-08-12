import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:odc/controller/shared/bloc/cubit_regiser/register_cubit.dart';

import '../constant/design.dart';
import '../constant/validator.dart';
import '../resource/assets_manager.dart';
import '../resource/color_manager.dart';
import '../resource/fonts_manager.dart';
import '../resource/route_manager.dart';
import '../resource/style_manager.dart';
import '../resource/text_manager.dart';
import '../resource/value_manager.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var cubit = RegisterCubit.get(context);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: height,
          child: Stack(
            children: [
              upDesign(context),
              downDesign(context),
              Padding(
                padding: const EdgeInsets.all(AppPadding.p14),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
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
                                      text: TextManager.hello,
                                      fontSize: AppSize.s35,
                                      color: ColorManager.headTextColor),
                                  buildTextLoginScreen(
                                      text: TextManager.friend,
                                      fontSize: AppSize.s35,
                                      color: ColorManager.primary),
                                ],
                              ),
                              buildTextLoginScreen(
                                  text: TextManager.signUp,
                                  fontSize: AppSize.s28,
                                  color: ColorManager.paragraph),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * .03,
                      ),
                      Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              buildTextFormField(
                                hintText: TextManager.fullName,
                                controller: fullNameController,
                                icon: const Icon(Icons.perm_identity),
                                fieldValidator: requireValidator,
                              ),

                              // emailValidator
                              buildTextFormField(
                                  hintText: TextManager.email,
                                  controller: emailController,
                                  icon: const Icon(Icons.email_outlined),
                                  fieldValidator: emailValidator,
                                  inputType: TextInputType.emailAddress),

                              BlocBuilder<RegisterCubit, RegisterState>(
                                builder: (context, state) {
                                  return buildTextFormField(
                                      hintText: TextManager.password,
                                      controller: passwordController,
                                      icon: const Icon(
                                          Icons.lock_outline_rounded),
                                      password: cubit.swap,
                                      fieldValidator: passwordValidator,
                                      inputType: TextInputType.text,
                                      showPrefixIcon: true,
                                      swapPrefixIcon: cubit.swap,
                                      width: width,
                                      function: () {
                                        cubit.changeFunction();
                                      });
                                },
                              ),

                              buildTextFormField(
                                  hintText: TextManager.phoneNumber,
                                  controller: phoneNumberController,
                                  icon: const Icon(Icons.phone),
                                  fieldValidator: phoneValidator,
                                  inputType: TextInputType.phone),

                              buildTextFormField(
                                  hintText: TextManager.address,
                                  controller: addressController,
                                  icon:
                                      const Icon(Icons.location_on_outlined),
                                  fieldValidator: addressValidator),
                              Row(
                                children: [
                                  BlocBuilder<RegisterCubit, RegisterState>(
                                    builder: (context, state) {
                                      return Checkbox(
                                        checkColor: Colors.white,
                                        value: cubit.privacy,
                                        onChanged: (bool? value) {
                                          cubit.changePrivacy();
                                        },
                                      );
                                    },
                                  ),
                                  Text(
                                    TextManager.doYouAgreeToOur,
                                    style:
                                        getSemiBoldStyle(color: Colors.black),
                                  ),
                                  buildTextButton(
                                      text: TextManager.privacyPolicy,
                                      function: () {})
                                ],
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    onLoading(context);
                                    if (_formKey.currentState!.validate()&& cubit.privacy==true) {
                                      cubit
                                          .register(
                                              name: fullNameController.text,
                                              email: emailController.text,
                                              password:
                                                  passwordController.text,
                                              phone:
                                                  phoneNumberController.text,
                                              address: addressController.text)
                                          .then((value) {
                                        if (cubit.registerModel?.success ==
                                            true) {
                                          offLoading(context);

                                          Navigator.pushReplacementNamed(
                                              context, Routes.loginRoute);
                                        } else {
                                          offLoading(context);
                                          alert(context: context, text: cubit.registerModel!.message.toString());
                                        }
                                      });
                                    }else{
                                      offLoading(context);
                                    }
                                  },
                                  child: const Text(TextManager.SignUp)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    TextManager.alreadyHaveAnAccount,
                                    style:
                                        getSemiBoldStyle(color: Colors.black),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacementNamed(
                                            context, Routes.loginRoute);
                                      },
                                      child: const Text(
                                        TextManager.logIn,
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: FontSize.s14),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
