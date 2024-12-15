import 'package:bloc/bloc.dart';
import 'package:hall_management_client/data/models/network_response.dart';
import 'package:hall_management_client/data/utils/current_user_controller.dart';
import 'package:hall_management_client/data/utils/network_caller.dart';
import 'package:hall_management_client/data/utils/urls.dart';
import 'package:meta/meta.dart';

import '../../data/models/user_model.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void getUser() async{
    emit(UserInitial());
    String? uid=await CurrentUserController.get();
    if(uid==null){
      return null;
    }
    NetworkResponse response = await NetworkCaller.getRequest(url: Urls.getUser(uid));
    if(response.isSuccess){
      User user=User.fromJson(response.responseData["result"]["data"]);
      emit(UserLoaded(user: user));
    }else{
      emit(UserError(error: response.errorMessage??'Something went wrong, try again'));
    }
  }
}
