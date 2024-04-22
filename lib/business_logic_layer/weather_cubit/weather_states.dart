
import '../../data_layer/model/weather_model.dart';

abstract class WeatherStates{}

class WeatherInitialState extends WeatherStates{}

class GetWeatherDataSuccessState extends WeatherStates{
  final WeatherModel weatherModel;

  GetWeatherDataSuccessState(this.weatherModel);
}
class GetWeatherDataErrorState extends WeatherStates{}