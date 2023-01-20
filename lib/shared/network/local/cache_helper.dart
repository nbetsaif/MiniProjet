import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static late SharedPreferences sharedPreferences;

  static init() async{
    sharedPreferences=await SharedPreferences.getInstance();
  }

  static Future<bool> putBool ({required String key, required bool data })async{
    return await sharedPreferences.setBool(key, data);
  }

  static bool? getBoolData({required key}){
    return sharedPreferences.getBool(key);
  }

  static dynamic getData({required key}){
    return sharedPreferences.get(key);
  }

  static Future<dynamic>  putData({required String key,required dynamic data})async
  {
    if (data is bool)
    {
      return await(sharedPreferences.setBool(key, data));
    }
    if (data is String) {
      return await(sharedPreferences.setString(key, data));
    }
    if(data is int) {
      return await(sharedPreferences.setInt(key, data));
    } else {
      return await(sharedPreferences.setDouble(key, data));
    }
  }
}