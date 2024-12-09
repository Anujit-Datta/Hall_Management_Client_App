import 'dart:developer';
import 'package:hall_management_client/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CurrentUserController{
  static User? currentUser;

  static const _key='user';

  static Future<void> set(String data)async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    await sharedPreferences.setString(_key, data);
    log("saved: ${sharedPreferences.getString(_key)??'null'}");
    currentUser=User.fromRawJson(data);
  }

  static Future<User> get()async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    currentUser=User.fromRawJson(sharedPreferences.getString(_key)??'');
    return currentUser!;
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
    currentUser=null;
  }
}