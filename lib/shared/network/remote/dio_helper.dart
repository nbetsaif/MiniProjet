import 'package:dio/dio.dart';
import 'package:mini_projet/shared/constants/constants.dart';

class DioHelper{
  static late Dio dio;
  static void init(){
    dio=Dio(
        BaseOptions(
            baseUrl:baseUrl,
            receiveDataWhenStatusError: true
        )
    );
  }

  static Future getData(
      {required String url,
        Map<String,dynamic>? query,
        String lang ='en',
        dynamic token
      }
      )async{
    dio.options.headers= {
      'Content-Type' : 'application/json',
      'lang': lang,
      'Authorization': token??''
    };
    return await dio.get(url,queryParameters: query);
  }

  static Future postData(
      {
        required String url ,
        required dynamic data,
        dynamic query,
        String lang ='en',
        dynamic token
      }
      )async{
    dio.options.headers= {
      'Content-Type' : 'application/json',
      'lang': lang,
      'Authorization': token??''
    };
    return await dio.post(url,data:data,queryParameters: query );
  }


  static Future putData(
      {
        required String url ,
        required dynamic data,
        dynamic query,
        String lang ='en',
        dynamic token
      }
      )async{
    dio.options.headers= {
      'Content-Type' : 'application/json',
      'lang': lang,
      'Authorization': token??''
    };
    return await dio.put(url,data:data,queryParameters: query );
  }

  static Future deleteData(
      {
        required String url ,
        dynamic query,
        String lang ='en',
        dynamic token
      }
      )async{
    dio.options.headers= {
      'Content-Type' : 'application/json',
      'lang': lang,
      'Authorization': token??''
    };
    return await dio.delete(url,queryParameters: query );
  }

}