import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart';
import 'package:hall_management_client/bloc/auth/auth_bloc.dart';
import 'package:hall_management_client/ui/widgets/background.dart';
import 'package:hall_management_client/utils/context_extensions.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../utils/app_fonts.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.token});
  final String token;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpTEC = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size sizes = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Center(
        child: Background(
          child: Neumorphic( //Main Box
              style: NeumorphicStyle(
                  shape: NeumorphicShape.convex,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
                  depth: 6,
                  intensity: 0.8,
                  lightSource: LightSource.topLeft,
                  color: context.theme.secondaryHeaderColor.withOpacity(0.5),
                  shadowDarkColor: context.theme.shadowColor.withOpacity(0.5),
                  shadowLightColor: Colors.white),
              child: SizedBox(
                height: sizes.height * 0.3,
                width: sizes.width * 0.8,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: sizes.height * 0.01),
                      Text(
                        'Verify OTP',
                        style: ipm.copyWith(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: sizes.height * 0.05),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: PinCodeTextField(
                          appContext: context,
                          length: 4,
                          obscureText: false,
                          animationType: AnimationType.fade,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 50,
                            fieldWidth: 40,
                            activeColor: context.theme.primaryColor,
                            inactiveColor: context.theme.disabledColor,
                            selectedColor: context.theme.hintColor,
                          ),
                          cursorColor: context.theme.primaryColorLight,
                          animationDuration: const Duration(milliseconds: 300),
                          enableActiveFill: false,
                          controller: _otpTEC,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(height: sizes.height * 0.02),
                      NeumorphicButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(OtpVerifyEvent(
                                otp: _otpTEC.text.trim(),
                                token: widget.token
                                ));
                          }
                        },
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.flat,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(20)),
                          depth: 5,
                          intensity: 0.8,
                          lightSource: LightSource.topLeft,
                          color: context.theme.primaryColor
                              .withOpacity(0.3),
                          shadowDarkColor:
                              context.theme.shadowColor.withOpacity(0.5),
                          shadowLightColor: Colors.white,
                        ),
                        child: const Text('Verify'),
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
