
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
 static late SharedPreferences sharedPreferences;

static Future<void> initial()async{
sharedPreferences = await SharedPreferences.getInstance();
}
//save data

static Future<bool>storedata({required String key,required dynamic value})async{
  if(value is double){
        return await sharedPreferences.setDouble(key, value) ;
    }
     else if(value is int){
        return await sharedPreferences.setInt(key, value) ;
    }
   else if(value is bool){
        return await sharedPreferences.setBool(key, value) ;
    }
   else if(value is String){
        return await sharedPreferences.setString(key, value) ;
    }
    else{
      return await sharedPreferences.setStringList(key, value) ;  
    }
}//get data
static Future getdata({required String key})async{
    return  sharedPreferences.get(key);

}
//remove data
 static Future<bool> removedata({required String key})async{
    return await sharedPreferences.remove(key);
 }

 //clear for all data
 static Future<bool> cleardata()async{
    return await sharedPreferences.clear();
 }

 static Future<bool> containkey({required String key})async{
    return sharedPreferences.containsKey(key);
 }
}