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



  Future<void> openGps() async {
    try {
      Location gps = Location();
      bool isOn = await gps.serviceEnabled();
      if (!isOn) {
        await gps.requestService();
        emit(OpenGpsSuccessState());
      }
    } catch (e) {
      print('Error enabling GPS: $e');
      emit(OpenGpsErrorState());
    }
  }


  Future<Position> getLocationLatAndLon() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception('Location services are disabled.');

      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {

          throw Exception('Location permissions are denied.');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      Position position = await Geolocator.getCurrentPosition();
      print(position);
      emit(GetLocationSuccessState());
      return position;

    } catch (e) {
      print('Error getting location: $e');
      emit(GetLocationErrorState());
      throw e;

    }
  }



  WeatherModel? weatherModel;
  Future<void> getWeatherData(double lat,double lon)async {
    await weatherRepository.getWeatherData(lat, lon).then((value) {
      weatherModel=value;
      print(weatherModel!.countryName);
      emit(GetWeatherDataSuccessState(weatherModel!));
    }
    ).catchError((error){
      print(error.toString());
      emit(GetWeatherDataErrorState(error.toString()));
    });
  }


  Future<void> getAllData() async {
    try {
      await openGps();
      Position position = await getLocationLatAndLon();
      await getWeatherData(position.latitude, position.longitude);
    } catch (e) {
      print('Error fetching all data: $e');
    }
  }




}