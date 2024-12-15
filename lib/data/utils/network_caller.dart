import 'dart:convert';
import 'dart:developer';
import 'package:hall_management_client/data/utils/user_auth_controller.dart';
import 'package:http/http.dart';
import '../models/network_response.dart';

class NetworkCaller{
  static Future<NetworkResponse> getRequest({required String url})async{
    try{
      log(url);
      String token = await AuthController.getToken();
      log(token);
      Response response;
      if(token.isNotEmpty){
        response = await get(Uri.parse(url), headers: {
          "Authorization": "Bearer $token",
        });
      }else{
        response = await get(Uri.parse(url));
      }
      log(response.request!.headers.toString());
      log(response.body);
      if(response.statusCode==200 || response.statusCode==201){
        final decodedResponse=jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodedResponse,
        );
      }else if(response.statusCode==401 || response.statusCode==400){
        goToSignInScreen();
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: jsonDecode(response.body)['message'],
        );
      }else{
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: jsonDecode(response.body)['message'],
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
    String token = await AuthController.getToken();
    try{
      Map<String,String> header = <String,String>{
        'accept':'application/json',
        'Content-Type':'application/json'
      };
      if(await AuthController.isLoggedIn()){
        header['Authorization']="Bearer $token";
      }
      final Response response = await post(
        Uri.parse(url),
        headers: header,
        body: jsonEncode(body),
      );
      log(response.request?.headers.toString()??'null');
      log(response.body);
      if(response.statusCode==200 || response.statusCode==201){
        final decodedResponse=jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodedResponse,
        );
      }else if(response.statusCode==401 || response.statusCode==400){
        goToSignInScreen();
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          responseData: jsonDecode(response.body),
        );
      }else{
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          responseData: jsonDecode(response.body),
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
    //AuthController.deleteData();
  }
}