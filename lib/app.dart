import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hall_management_client/bloc/user/user_cubit.dart';
import 'package:hall_management_client/ui/utils/routes.dart';

import 'bloc/auth/auth_bloc.dart';

class HallManager extends StatelessWidget {
  const HallManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (BuildContext context) => AuthBloc()),
        BlocProvider(create: (BuildContext context) => UserCubit()),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        builder: EasyLoading.init(),
        theme: FlexThemeData.light(scheme: FlexScheme.aquaBlue),
        //darkTheme: FlexThemeData.dark(scheme: FlexScheme.aquaBlue),
        themeMode: ThemeMode.light,
      ),
    );
  }
}
