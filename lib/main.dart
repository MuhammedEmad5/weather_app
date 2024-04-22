import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_weather_app/presentation_layer/screens/home_screen.dart';
import 'package:new_weather_app/shared/constant/bloc_observer.dart';

import 'business_logic_layer/weather_cubit/weather_cubit.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => WeatherCubit()..getAllData(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, child) {
          return MaterialApp(
              theme: ThemeData(),
              debugShowCheckedModeBanner: false,
              home: const HomeScreen());
        },
      ),
    );
  }
}
