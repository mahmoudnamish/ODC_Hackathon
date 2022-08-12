import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:odc/controller/shared/bloc/cubit_forget_password/forget_password_cubit.dart';
import 'package:odc/view/resource/color_manager.dart';

import '../../constant/design.dart';
import '../../constant/validator.dart';
import '../../resource/assets_manager.dart';
import '../../resource/route_manager.dart';
import '../../resource/style_manager.dart';
import '../../resource/text_manager.dart';
import '../../resource/value_manager.dart';
class ForgetPassword extends StatelessWidget {
   ForgetPassword({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _FormKey =  GlobalKey<FormState>();
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
                      ImageAssets.lockLogo
                    ),
                    SizedBox(
                      height:height*.04 ,
                    ),
                    SizedBox(
                      width:width*.7 ,
                      child:   Text(
                      textAlign: TextAlign.center,
                        TextManager.forgetPasswordScreenTextOne,
                        style: getBoldStyle(color: Colors.black , fontSize: AppSize.s18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height:height*.04 ,
                    ),
                    Form(
                      key: _FormKey,
                      child: buildTextFormField(
                        fieldValidator: emailValidator,
                        controller: emailController,
                        hintText: TextManager.email,
                        icon: const Icon(
                          Icons.email
                        ),
                      ),
                    ),
                    SizedBox(
                      height:height*.04 ,
                    ),
                    SizedBox(
                      width: width*.7,
                      child: ElevatedButton(onPressed: () async{
                        // u will edit her ok y bro
                        onLoading(context);

                        if(_FormKey.currentState!.validate()){

                          await cubit.sendMessageToEmail(email: emailController.text).then((value) {
                            if(cubit.resetPassword?.success==true){

                              cubit.email = emailController.text;
                              Navigator.pushNamed(context,Routes.verifyYourEmailScreen , arguments: {'email': emailController.text});
                              offLoading(context);

                            }else{
                             offLoading(context);
                              alert(
                               context: context,
                                text: cubit.resetPassword!.message.toString(),
                              );

                            }
                          });

                        }

                      },
                        child: const Text(TextManager.send) ,

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
