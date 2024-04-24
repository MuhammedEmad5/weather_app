
import '../../data_layer/model/weather_model.dart';

abstract class WeatherStates{}

class WeatherInitialState extends WeatherStates{}

class OpenGpsSuccessState extends WeatherStates{}
class OpenGpsErrorState extends WeatherStates{}

class GetLocationSuccessState extends WeatherStates{}
class GetLocationErrorState extends WeatherStates{}

class GetWeatherDataSuccessState extends WeatherStates{
  final WeatherModel weatherModel;

  GetWeatherDataSuccessState(this.weatherModel);
}
class GetWeatherDataErrorState extends WeatherStates{
  final String error;

  GetWeatherDataErrorState(this.error);
}