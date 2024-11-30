import 'dart:convert';
import 'dart:developer';
import 'package:hall_management_client/data/utils/user_auth_controller.dart';
import 'package:http/http.dart';
import '../models/network_response.dart';

class NetworkCaller{
  static Future<NetworkResponse> getRequest({required String url})async{
    try{
      log(url);
      final Response response = await get(Uri.parse(url),headers: {
        'token' : AuthController.accessToken
      });
      log(response.statusCode.toString());
      log(response.body);
      if(response.statusCode==200 || response.statusCode==201){
        final decodedResponse=jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodedResponse,
        );
      }else if(response.statusCode==401){
        goToSignInScreen();
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      }else{
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      }
    }catch(error){
      log(error.toString());
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: error.toString(),
      );
    }
  }

  static Future<NetworkResponse> postRequest({required String url,required Map<String,dynamic> body})async{
    log(url);
    log(body.toString());
    try{
      Map<String,String> header = <String,String>{
        'accept':'application/json',
        'Content-Type':'application/json'
      };
      if(await AuthController.isLoggedIn()){
        header['token']=AuthController.accessToken;
      }
      final Response response = await post(
        Uri.parse(url),
        headers: header,
        body: jsonEncode(body),
      );
      log(response.statusCode.toString());
      log(response.body);
      if(response.statusCode==200){
        final decodedResponse=jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodedResponse,
        );
      }else if(response.statusCode==401){
        goToSignInScreen();
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      }else{
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      }
    }catch(error){
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: error.toString(),
      );
    }
  }

  static void goToSignInScreen()async{
    AuthController.deleteData();

  }
}