import 'dart:developer';
import 'package:hall_management_client/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CurrentUserController{
  static String? currentUserId;

  static const _key='uid';

  static Future<void> set(String data)async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    await sharedPreferences.setString(_key, data);
    log("saved: ${sharedPreferences.getString(_key)??'null'}");
    currentUserId=data;
  }

  static Future<String?> get()async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    currentUserId=sharedPreferences.getString(_key);
    return currentUserId;
  }

  // static Future<bool> isLoggedIn()async{
  //   try{
  //     String token = await getToken();
  //     return token.isNotEmpty;
  //   }catch(e){
  //     log(e.toString());
  //     return false;
  //   }
  // }

  static Future<void> delete()async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    currentUserId=null;
  }
}