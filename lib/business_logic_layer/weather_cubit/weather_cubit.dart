import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:new_weather_app/business_logic_layer/weather_cubit/weather_states.dart';
import '../../data_layer/api_server/api_dio.dart';
import '../../data_layer/model/weather_model.dart';
import '../../data_layer/repository/repository.dart';

class WeatherCubit extends Cubit<WeatherStates>{

  final WeatherRepository weatherRepository=WeatherRepository(WeatherDio());

  WeatherCubit():super(WeatherInitialState());
 WeatherCubit get(context)=>BlocProvider.of(context);



  Future<void>openGps()async{
    Location gps = Location();
    bool isOn = await gps.serviceEnabled();
    if (!isOn) {
      await gps.requestService();
    }
  }

  Position? position;
  Future<Position> getLocationLatAndLon() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

   return await Geolocator.getCurrentPosition().then((value) {
      position=value;
      print(position);
      return value;
    });
  }



  WeatherModel? weatherModel;
  Future<void> getWeatherData(double lat,double lon)async {
    await weatherRepository.getWeatherData(lat, lon).then((value) {
      weatherModel=value;
      print(weatherModel!.countryName);
      emit(GetWeatherDataSuccessState(weatherModel!));
      return value;
    });
  }


    Future<void>getAllData()async {
    openGps().then((value) {
      getLocationLatAndLon().then((value) {
        getWeatherData(value.latitude, value.longitude);
      });
    });
  }



}