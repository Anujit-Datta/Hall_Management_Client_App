import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hall_management_client/bloc/auth/auth_bloc.dart';
import 'package:hall_management_client/bloc/user/user_cubit.dart';
import 'package:hall_management_client/data/utils/current_user_controller.dart';
import 'package:hall_management_client/data/utils/user_auth_controller.dart';
import 'package:hall_management_client/ui/screens/login.dart';
import 'package:hall_management_client/ui/utils/dummy_user.dart';
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

  _getProfile() async {
    context.read<UserCubit>().getUser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserLoaded) {
          currentUser = state.user;
        }else{
          currentUser=dummyUser;
        }
        return Scaffold(
          body: state is UserInitial
              ? const Center(child: CircularProgressIndicator())
              : state is UserError
                  ? Center(
                      child: Text(state.error),
                    )
                  : HomeBody(user: (state as UserLoaded).user),
          appBar: AppBar(
            titleSpacing: context.screenWidth*0.03,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  currentUser!.borderNo!=0?currentUser!.borderNo.toString():'',
                  style: TextStyle(
                    fontSize: 55,
                    color: context.theme.primaryColorLight,
                  ),
                ),
                // Container(
                //   width: 2,
                //   height: 40,
                //   color: context.theme.primaryColorLight,
                // ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${currentUser!.firstName} ${currentUser!.lastName}',
                      style: TextStyle(
                          color: context.theme.primaryColorLight, fontSize: 25),
                    ),
                    Text(
                      currentUser!.email,
                      style: TextStyle(
                          color: context.theme.primaryColorLight, fontSize: 15),
                    ),
                  ],
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
      },
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.screenWidth*0.02, vertical: context.screenHeight*0.01),
      child: const Column(
        children: [
          Row(
            children: [
              dashboardCard(title: "Paid",subtitle:"(current month)",value: 3500,),
              dashboardCard(title: "Balance",subtitle:"(previous month)",value: -1000,),
            ],
          ),
          Row(
            children: [
              dashboardCard(title: "Meal",subtitle:"(current month)",value: 25,),
              dashboardCard(title: "Cost",subtitle:"(estimated)",value: 1000,),
            ],
          ),
        ],
      )
    );
  }
}

class dashboardCard extends StatelessWidget {
  const dashboardCard({
    super.key,
    required this.subtitle,
    required this.value,
    required this.title,
  });
  final String subtitle;
  final String title;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: context.colorScheme.primary,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.screenWidth*0.02, vertical: context.screenHeight*0.01),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                value.toString(),
                style: TextStyle(
                  fontSize: 40,
                  color: context.colorScheme.onPrimary,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  color: context.colorScheme.onPrimary,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  color: context.colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
