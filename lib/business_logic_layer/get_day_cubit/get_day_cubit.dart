
import 'package:flutter_bloc/flutter_bloc.dart';

import 'get_day_states.dart';



class GetDayCubit extends Cubit<GetDayStates>{


  GetDayCubit():super(GetDayInitialState());
  GetDayCubit get(context)=>BlocProvider.of(context);


  String? prePre;
  String? pre;
  String? today;
  String? next;
  String? nextNext;

  void getDay() {
    int numDay = DateTime.now().weekday;
    if (numDay == 1) {
      prePre = 'Sat';
      pre = 'Sun';
      today = 'Mon';
      next = 'Tue';
      nextNext = 'Wed';
    }
    else if (numDay == 2) {
      prePre = 'Sun';
      pre = 'Mon';
      today = 'Tue';
      next = 'Wed';
      nextNext = 'Thu';
    }
    else if (numDay == 3) {
      prePre = 'Mon';
      pre = 'Tue';
      today = 'Wed';
      next = 'Thu';
      nextNext = 'Fri';
    }
    else if (numDay == 4) {
      prePre = 'Tue';
      pre = 'Wed';
      today = 'Thu';
      next = 'Fri';
      nextNext = 'Sat';
    }
    else if (numDay == 5) {
      prePre = 'Wed';
      pre = 'Thu';
      today = 'Fri';
      next = 'Sat';
      nextNext = 'Sun';
    }
    else if (numDay == 6) {
      prePre = 'Thu';
      pre = 'Fri';
      today = 'Sat';
      next = 'Sun';
      nextNext = 'Mon';
    }
    else {
      prePre = 'Sat';
      pre = 'Sun';
      today = 'Mon';
      next = 'Tue';
      nextNext = 'Wed';
    }
  }



}