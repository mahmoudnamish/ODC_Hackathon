import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:odc/controller/shared/bloc/cubit_forget_password/forget_password_cubit.dart';

import '../../constant/design.dart';
import '../../constant/validator.dart';
import '../../resource/assets_manager.dart';
import '../../resource/route_manager.dart';
import '../../resource/style_manager.dart';
import '../../resource/text_manager.dart';
import '../../resource/value_manager.dart';
class CreateNewPassword extends StatelessWidget {
  CreateNewPassword({Key? key}) : super(key: key);
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit = ForgetPasswordCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TextManager.forgetPasswordScreen,style: getBoldStyle(
            color: Colors.black ,
            fontSize: AppSize.s18
        ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: height,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p18),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                      ImageAssets.unLockLogo
                  ),
                  SizedBox(
                    height:height*.04 ,
                  ),
                  SizedBox(
                    width:width*.7 ,
                    child:   Text(
                      textAlign: TextAlign.center,
                      TextManager.enterYourNewPassword,
                      style: getBoldStyle(color: Colors.black , fontSize: AppSize.s18,
                      ),
                    ),
                  ),

                  Form(
                    key: _key,child: Column(
                    children: [
                      SizedBox(
                        height:height*.04 ,
                      ),

                      BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
                        builder: (context, state) {
                          return buildTextFormField(
                              hintText: TextManager.newPassword,
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
                      SizedBox(
                        height:height*.04 ,
                      ),
                      BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
                        builder: (context, state) {
                          return buildTextFormField(
                              hintText: TextManager.newPassword,
                              controller: passwordConfirmController,
                              icon: const Icon(
                                  Icons.lock_outline_rounded),
                              password: cubit.swap2,
                              fieldValidator: (value){
                                if(value.isEmpty){
                                  return 'Empty';
                                }
                                if(value != passwordController.text){
                                  return "Not Match";
                                }else{
                                  return null;
                                }

                              },
                              inputType: TextInputType.text,
                              showPrefixIcon: true,
                              swapPrefixIcon: cubit.swap2,
                              width: width,
                              function: () {
                                cubit.changeFunction2();
                              });
                        },
                      ),

                    ],
                  ),

                  ),
                  SizedBox(
                    width: width*.7,
                    child: ElevatedButton(onPressed: (){
                      // u will edit her ok y bro
                      onLoading(context);
                      if(_key.currentState!.validate()){
                        cubit.resetNewPassword(email: cubit.email.toString(),
                            OTP: cubit.otp.toString(), password: passwordConfirmController.text)
                            .then((value){
                              if(cubit.newPassword!.success ==true){

                                Navigator.pushReplacementNamed(context,Routes.loginRoute );
                                offLoading(context);
                              }else{
                                offLoading(context);
                                alert(context: context, text: cubit.newPassword!.message.toString());
                              }
                        });

                      }else{
                        offLoading(context);

                      }

                    },
                      child: const Text(TextManager.submit) ,

                    ),
                  )


                ],
              ),
            ),
          ),
        ),
      ),
    );
  },
);
  }
}
