import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../business_logic_layer/get_day_cubit/get_day_cubit.dart';
import '../../business_logic_layer/get_day_cubit/get_day_states.dart';
import '../../shared/constant/app_colors.dart';
import '../../shared/constant/app_strings.dart';


class DayOfWeekItem extends StatelessWidget {
  const DayOfWeekItem({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context)=>GetDayCubit()..getDay(),
      child: BlocBuilder<GetDayCubit,GetDayStates>(
        builder: (BuildContext context, state) {
          var cubit=GetDayCubit().get(context);
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              cubit.prePre!,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w300,
                color: AppColors.withe,
                fontFamily: AppStrings.montserrat,
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              cubit.pre!,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.withe,
                fontFamily: AppStrings.montserrat,
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Container(
              height: 40.h,
              width: 80.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(width: 2.w, color: AppColors.withe),
                  borderRadius: BorderRadius.circular(10.r)),
              child: Text(
                cubit.today!,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.withe,
                  fontFamily: AppStrings.montserrat,
                ),
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              cubit.next!,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.withe,
                fontFamily: AppStrings.montserrat,
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              cubit.nextNext!,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w300,
                color: AppColors.withe,
                fontFamily: AppStrings.montserrat,
              ),
            ),
          ],
        );
      },
      ),
    );
  }
}
