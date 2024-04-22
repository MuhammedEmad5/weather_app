import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../business_logic_layer/weather_cubit/weather_cubit.dart';
import '../../business_logic_layer/weather_cubit/weather_states.dart';
import '../../shared/constant/app_colors.dart';
import '../../shared/constant/app_images.dart';
import '../../shared/constant/app_strings.dart';
import '../widgets/day_of_week.dart';
class SunnyScreen extends StatelessWidget {
  const SunnyScreen({Key? key}) : super(key: key);

  BoxDecoration backGroundDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            AppColors.orangeDeep,
            AppColors.orangeLight,
          ]),
      image: DecorationImage(
          image: AssetImage(AppImages.sunnyBackGround),
          fit: BoxFit.cover,
          alignment: AlignmentDirectional(-0.2, -5)),
    );
  }

  Widget countryText(WeatherCubit cubit) {
    return Expanded(
        child: Center(
      child: Text(
        cubit.weatherModel!.countryName!,
        style: TextStyle(
            fontSize: 40.sp,
            color: AppColors.withe,
            fontFamily: AppStrings.montserrat,
            fontWeight: FontWeight.w300),
      ),
    ));
  }

  Widget imageAndAnalogClock(WeatherCubit cubit) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: SizedBox(
          height: 110.h,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Image(
                image: AssetImage(
                  AppImages.sunnyIcon,
                ),
                height: 100,
                opacity: AlwaysStoppedAnimation(.8),
              ),
              const Spacer(),
              analogClock(cubit)
            ],
          ),
        ),
      ),
    );
  }

  Widget analogClock(WeatherCubit cubit) {
    return AnalogClock(
      decoration: BoxDecoration(
          border: Border.all(width: 3.0, color: AppColors.withe),
          color: Colors.transparent,
          shape: BoxShape.circle),
      width: 150.0,
      isLive: true,
      hourHandColor: Colors.black,
      minuteHandColor: Colors.black45,
      secondHandColor: Colors.black26,
      showSecondHand: true,
      numberColor: Colors.white,
      showNumbers: true,
      showAllNumbers: true,
      textScaleFactor: 1.4,
      showTicks: true,
      showDigitalClock: false,
      datetime: DateTime.now().toUtc().add(Duration(seconds: cubit.weatherModel!.timezone!)),
    );
  }

  Widget temperatureText(WeatherCubit cubit) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            (cubit.weatherModel!.weatherDegrees!.temp! - 272.15)
                .toStringAsFixed(2),
            style: TextStyle(
                fontSize: 40.sp,
                color: AppColors.withe,
                fontFamily: AppStrings.montserrat,
                fontWeight: FontWeight.w300),
          ),
          SizedBox(width: 5.w),
          Text(
            '°C',
            style: TextStyle(
                fontSize: 40.sp,
                color: AppColors.withe.withOpacity(0.8),
                fontFamily: AppStrings.montserrat,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget weatherStatusText(WeatherCubit cubit) {
    return Text(
      '≋ ${cubit.weatherModel!.weatherStatus![0].mainStatus!} ≋',
      style: TextStyle(
          fontSize: 20.sp,
          color: AppColors.withe,
          fontFamily: AppStrings.montserrat,
          fontWeight: FontWeight.w500),
    );
  }

  Widget pressureHumidityWindSpeedRow(WeatherCubit cubit) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Pressure',
                  style: TextStyle(
                      fontSize: 16,
                      color: AppColors.withe,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppStrings.montserrat),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '${cubit.weatherModel!.weatherDegrees!.pressure.toString()} hpa',
                  style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.withe,
                      fontWeight: FontWeight.w300,
                      fontFamily: AppStrings.montserrat),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Humidity',
                  style: TextStyle(
                      fontSize: 16,
                      color: AppColors.withe,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppStrings.montserrat),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '${cubit.weatherModel!.weatherDegrees!.humidity.toString()} %',
                  style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.withe,
                      fontWeight: FontWeight.w300,
                      fontFamily: AppStrings.montserrat),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Wind Speed',
                  style: TextStyle(
                      fontSize: 16,
                      color: AppColors.withe,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppStrings.montserrat),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '${cubit.weatherModel!.wind!.speed.toString()} m/s',
                  style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.withe,
                      fontWeight: FontWeight.w300,
                      fontFamily: AppStrings.montserrat),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget minAndMaxTemperature(WeatherCubit cubit) {
    return Center(
      child: Text(
        '${(cubit.weatherModel!.weatherDegrees!.tempMin! - 272.15).toStringAsFixed(2)}'
        ' / ${(cubit.weatherModel!.weatherDegrees!.tempMax! - 272.15).toStringAsFixed(2)}  °C',
        style: TextStyle(
            fontSize: 15.sp,
            color: AppColors.withe,
            fontFamily: AppStrings.montserrat,
            fontWeight: FontWeight.w400),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherStates>(
      builder: (BuildContext context, state) {
        WeatherCubit cubit = WeatherCubit().get(context);
        return Scaffold(
          body: Container(
            decoration: backGroundDecoration(),
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  countryText(cubit),
                  imageAndAnalogClock(cubit),
                  temperatureText(cubit),
                  weatherStatusText(cubit),
                  pressureHumidityWindSpeedRow(cubit),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        minAndMaxTemperature(cubit),
                        SizedBox(height: 5.h),
                        const DayOfWeekItem(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
