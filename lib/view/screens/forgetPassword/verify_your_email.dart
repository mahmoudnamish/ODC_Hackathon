import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:odc/controller/shared/bloc/cubit_forget_password/forget_password_cubit.dart';
import 'package:pinput/pinput.dart';
import '../../constant/design.dart';
import '../../resource/assets_manager.dart';
import '../../resource/color_manager.dart';
import '../../resource/route_manager.dart';
import '../../resource/style_manager.dart';
import '../../resource/text_manager.dart';
import '../../resource/value_manager.dart';
class VerifyYourEmail extends StatefulWidget {
  String ?email;

    VerifyYourEmail({Key? key, required this.email}) : super(key: key) ;

  @override
  State<VerifyYourEmail> createState() => _VerifyYourEmailState();
}

class _VerifyYourEmailState extends State<VerifyYourEmail> {
  String _pin ='';
  TextEditingController pin =   TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
  return  BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
    listener: (context, state) {
      // TODO: implement listener
    },
    builder: (context, state) {
      var cubit = ForgetPasswordCubit.get(context);
      print(      cubit.email
      );
      return Scaffold(
        appBar: AppBar(
          title: Text(
            TextManager.verifyYourEmail,style: getBoldStyle(
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
                        ImageAssets.messageLogo
                    ),
                    SizedBox(
                      height:height*.04 ,
                    ),
                    SizedBox(
                        child:   Column(
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              TextManager.verifyTextScreen,
                              style: getBoldStyle(color: Colors.black , fontSize: AppSize.s18,
                              ),
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              widget.email!,
                              style: getBoldStyle(color: ColorManager.primary , fontSize: AppSize.s18,
                              ),
                            ),
                          ],
                        )
                    )
                    ,
                    SizedBox(
                      height:height*.04 ,
                    ),
                    Form(
                      key: _formKey,
                      child: Pinput(
                        controller: pin,
                        onCompleted: (pin)
                        {
                        },
                      ),
                    ),
                    SizedBox(
                      height:height*.04 ,
                    ),
                    SizedBox(
                      width: width*.7,
                      child: ElevatedButton(
                        onPressed: () async{

                          if(_formKey.currentState!.validate()){
                            onLoading(context);
                            await cubit.verifyYourEmail(email: widget.email.toString()
                                , OTP: pin.text
                            ).then((value) {
                              if(cubit.verifyEmail?.success == true){
                                cubit.otp = pin.text;
                                offLoading(context);

                                Navigator.pushNamed(context, Routes.createNewPassword);
                              }else{
                                offLoading(context);

                                alert(
                                    text: cubit.verifyEmail!.message.toString(),
                                    context: context
                                );
                              }
                            });
                          }else{
                            offLoading(context);

                          }

                          // Here i will validate if  code is true
                        },
                        child: const Text(TextManager.verify) ,

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
