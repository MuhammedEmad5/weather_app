import '../api_server/api_dio.dart';
import '../model/weather_model.dart';


class WeatherRepository{
 final WeatherDio weatherDio;

  WeatherRepository(this.weatherDio);


 Future<WeatherModel>getWeatherData(double lat,double lon)async{
   try{
     final weather=await weatherDio.getWeatherData(lat, lon);

     return WeatherModel.fromJson(weather);
   }catch(e){
     print('the error is ${e.toString()}');
     return WeatherModel();
   }
 }

}