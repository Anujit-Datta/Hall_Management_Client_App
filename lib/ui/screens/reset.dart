import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart';
import 'package:hall_management_client/bloc/auth/auth_bloc.dart';
import 'package:hall_management_client/ui/widgets/background.dart';
import 'package:hall_management_client/utils/context_extensions.dart';

import '../utils/app_fonts.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({super.key});

  @override
  State<ResetScreen> createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  final TextEditingController _emailTEC = TextEditingController();
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
                        'Reset Password',
                        style: ipm.copyWith(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: sizes.height * 0.05),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Neumorphic(
                          style: NeumorphicStyle(
                            shape: NeumorphicShape.concave,
                            boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(20)),
                            depth: -5,
                            intensity: 0.8,
                            lightSource: LightSource.topLeft,
                            color: context.theme.secondaryHeaderColor
                                .withOpacity(0.5),
                            shadowDarkColor:
                                context.theme.shadowColor.withOpacity(0.5),
                            shadowLightColor: Colors.white,
                          ),
                          child: TextFormField(
                            controller: _emailTEC,
                            style: ipm.copyWith(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Your Email',
                              hintStyle: ipm.copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email';
                              }else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value.trim())){
                                return 'Invalid email';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: sizes.height * 0.02),
                      NeumorphicButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(ResetRequestEvent(
                                email: _emailTEC.text,
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
                        child: const Text('Send OTP'),
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
