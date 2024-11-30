import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart';
import 'package:hall_management_client/bloc/auth/auth_bloc.dart';
import 'package:hall_management_client/ui/widgets/background.dart';
import 'package:hall_management_client/utils/context_extensions.dart';

import '../utils/app_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTEC = TextEditingController();
  final TextEditingController _passwordTEC = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size sizes = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Center(
        child: Background(
          child: Neumorphic(
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
                height: sizes.height * 0.4,
                width: sizes.width * 0.8,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: sizes.height * 0.01),
                      Text(
                        'Welcome Back',
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
                              hintText: 'Email',
                              hintStyle: ipm.copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
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
                          child: BlocBuilder<AuthBloc, AuthState>(
                            builder: (context, state) {
                              return TextFormField(
                                controller: _passwordTEC,
                                obscureText: (state as AuthInitial).isObscure,
                                style: ipm.copyWith(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: ipm.copyWith(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      context
                                          .read<AuthBloc>()
                                          .add(PassObscureToggleEvent());
                                    },
                                    icon: Icon(state.isObscure ?Icons.visibility_off:Icons.visibility),
                                    color: state.isObscure ?context.theme.disabledColor:context.theme.primaryColor,
                                  ),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      NeumorphicButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(LoginEvent(
                                email: _emailTEC.text,
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
                          color: context.theme.primaryColor
                              .withOpacity(0.3),
                          shadowDarkColor:
                              context.theme.shadowColor.withOpacity(0.5),
                          shadowLightColor: Colors.white,
                        ),
                        child: const Text('Login'),
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
