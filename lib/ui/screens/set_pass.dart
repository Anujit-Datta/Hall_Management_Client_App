import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart';
import 'package:hall_management_client/bloc/auth/auth_bloc.dart';
import 'package:hall_management_client/ui/widgets/background.dart';
import 'package:hall_management_client/utils/context_extensions.dart';

import '../utils/app_fonts.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key, required this.token});
  final String token;

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  final TextEditingController _confirmPassTEC = TextEditingController();
  final TextEditingController _passwordTEC = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size sizes = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Center(
        child: Background(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Neumorphic(
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
                  height: sizes.height * 0.45,
                  width: sizes.width * 0.8,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: sizes.height * 0.01),
                        Text(
                          'Set New Password',
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
                              controller: _passwordTEC,
                              style: ipm.copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.key,
                                  color: context.theme.disabledColor
                                      .withOpacity(0.2),
                                  size: 20,
                                ),
                                hintText: 'Password',
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
                                  return 'Required Field';
                                } else if (value.trim().length < 6) {
                                  return 'Minimum 6 characters';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: sizes.height * 0.02),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Neumorphic(
                            style: NeumorphicStyle(
                              shape: NeumorphicShape.flat,
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
                              controller: _confirmPassTEC,
                              style: ipm.copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.key,
                                  color: context.theme.disabledColor
                                      .withOpacity(0.2),
                                  size: 20,
                                ),
                                hintText: 'Password',
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
                                  return 'Required Field';
                                } else if (value.trim().length < 6) {
                                  return 'Minimum 6 characters';
                                } else if (value.trim() !=
                                    _passwordTEC.text.trim()) {
                                  return 'Password does not match';
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
                              context.read<AuthBloc>().add(SetPasswordEvent(
                                  token: widget.token,
                                  password: _passwordTEC.text));
                            }
                          },
                          style: NeumorphicStyle(
                            shape: NeumorphicShape.flat,
                            boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(20)),
                            depth: 5,
                            intensity: 0.8,
                            lightSource: LightSource.topLeft,
                            color: context.theme.primaryColor.withOpacity(0.3),
                            shadowDarkColor:
                                context.theme.shadowColor.withOpacity(0.5),
                            shadowLightColor: Colors.white,
                          ),
                          child: Text(
                            'Set',
                            style: ipm.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
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
