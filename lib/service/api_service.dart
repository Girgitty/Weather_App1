import 'dart:convert';

import 'package:http/http.dart';

import '../constants/constants.dart';
import '../model/weathermodel.dart';

class ApiService{



Future<weathermodel> getWeatherData(String searchText )async{

String url="$base_url&q=$searchText&days=7";

try{

 Response response = await get(Uri.parse(url));

 if(response.statusCode==200){

   Map<String,dynamic> json = jsonDecode(response.body);
   weathermodel weatherModel = weathermodel.fromJson(json);
   return weatherModel;


 }else{
   throw("No data found");
 }

}catch(e){

  throw e.toString();
}




}


}