import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hall_management_client/bloc/auth/auth_bloc.dart';
import 'package:hall_management_client/data/utils/current_user_controller.dart';
import 'package:hall_management_client/data/utils/user_auth_controller.dart';
import 'package:hall_management_client/ui/screens/login.dart';
import 'package:hall_management_client/utils/context_extensions.dart';

import '../../data/models/user_model.dart';
import '../widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  User? currentUser;
  @override
  void initState() {
    super.initState();
    _getProfile();
  }
  //TODO: convert to Current User Bloc
  _getProfile() async {
    currentUser = await CurrentUserController.get();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Center(
            child: Text(AuthController.accessToken.isNotEmpty
                ? 'Logged In'
                : 'Not Logged In'),
          );
        },
      ),
      appBar: AppBar(
        leadingWidth: (currentUser?.borderNo??0) >9? currentUser!.borderNo>99? 118: 90 : 65,
        titleSpacing: 0,
        leading: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(width: 20),
            Text(
              '41',
              style: TextStyle(
                fontSize: 55,
                color: context.theme.primaryColorLight,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 1,
              height: 40,
              color: context.theme.primaryColorLight,
            )
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              "${currentUser?.firstName} ${currentUser?.lastName}" ?? 'Home',
              style: TextStyle(
                color: context.theme.primaryColorLight,
                fontSize: 27
              ),
            ),
            Text(
              currentUser?.email ?? '',
              style: TextStyle(
                color: context.theme.primaryColorLight,
                fontSize: 15
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AuthBloc>().add(LogoutEvent());
            },
          ),
        ],
      ),

      //drawer: const SideNavBar(),
    );
  }
}
