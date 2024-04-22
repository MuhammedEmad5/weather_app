import 'package:dio/dio.dart';

import '../../shared/constant/app_strings.dart';


class WeatherDio{
  Dio? dio;

  WeatherDio(){
    BaseOptions options=BaseOptions(
      receiveDataWhenStatusError: true,
      receiveTimeout: 20*1000,
      connectTimeout: 20 *1000,
    );

    dio=Dio(options);
  }

  Future<dynamic>getWeatherData(double lat,double lon)async{
    try{
      Response response =await dio!.get(AppStrings.baseUrl,queryParameters: {
        'lat': lat,
        'lon': lon,
        'appid':AppStrings.apiKey,
      });
      return response.data;
    }catch(e){
      print(e.toString());
      return [];
    }
  }

}

//https://api.openweathermap.org/data/2.5/weather?lat=30.5760855&lon=31.0542988&appid=bd42f663c9785b88e844c30c069c7cb0