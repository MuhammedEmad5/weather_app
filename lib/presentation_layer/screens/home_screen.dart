import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:new_weather_app/presentation_layer/screens/rain_screen.dart';
import 'package:new_weather_app/presentation_layer/screens/sunny_screen.dart';
import '../../business_logic_layer/weather_cubit/weather_cubit.dart';
import '../../business_logic_layer/weather_cubit/weather_states.dart';
import 'cloud_storm_other_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget progressIndicator() {
    return LoadingAnimationWidget.inkDrop(
      size: 50,
      color: Colors.grey,
    );
  }

  Widget rainOrSunnyAndClearOrCloudAndOther(context, WeatherCubit cubit) {
    if (cubit.weatherModel!.weatherStatus![0].mainStatus == 'Rain') {
      return const RainScreen();
    } else if (cubit.weatherModel!.weatherStatus![0].mainStatus == 'Clear' ||
        cubit.weatherModel!.weatherStatus![0].mainStatus == 'Sunny') {
      return const SunnyScreen();
    } else {
      return const CloudStormAndOtherScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherStates>(
      builder: (BuildContext context, state) {
        var cubit = WeatherCubit().get(context);
        return Scaffold(
          body: WeatherCubit().get(context).weatherModel == null
              ? Center(child: progressIndicator())
              : rainOrSunnyAndClearOrCloudAndOther(context, cubit),
        );
      },
    );
  }
}
