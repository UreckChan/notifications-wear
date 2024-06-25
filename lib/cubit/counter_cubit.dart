import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment(){

    if(state < 10){
    emit(state + 1);
    }else{
      Fluttertoast.showToast(
       msg: "Límite alcanzado",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }

    }

  void decrement(){
    if(state > -10){
    emit(state - 1);
    }else{
      Fluttertoast.showToast(
       msg: "Límite alcanzado",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
    }
  
   
  void restart() => emit(0);
}