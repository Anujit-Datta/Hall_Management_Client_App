import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hall_management_client/bloc/auth/auth_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Center(
          child: Text(state is LoggedInState ? 'Logged In' : 'Not Logged In'),
        );
      },
    );
  }
}
