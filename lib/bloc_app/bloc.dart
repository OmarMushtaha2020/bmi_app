import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';
import 'state.dart';

class BlocApp extends Bloc<AppEvent, AppState> {
  BlocApp() : super(InitialState());

  static BlocApp get(context) => BlocProvider.of(context);
  bool isMale = true;
  double number = 180;
  double weight = 40;
  double age = 40;
  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is GenderSelected) {
      yield* selectTypeGender(event.gender!);
    }
    if (event is SliderValueChanged) {

      yield* changeValueOfSlider(event.value);
    }
    if (event is IncreaseAge) {
      yield* increaseMyAge();
    }
    if (event is ReduceAge) {
      yield* reduceMyAge();
    }
    if (event is IncreaseWeight) {
      yield* increaseMyWeight();
    }
    if (event is ReduceWeight) {
      yield* reduceMyWeight();
    }
  }




  Stream<AppState> selectTypeGender(bool value) async*{
    isMale = value;
    yield GenderSelectedSuccessfully();
  }

  Stream<AppState> changeValueOfSlider(value) async*{
    number = value;
    yield SliderValueChangedSuccessfully();
  }

  Stream<AppState> increaseMyAge()  async* {
    age++;
    yield IncreaseAgeSuccessfully();
  }

  Stream<AppState>  reduceMyAge()async* {
    age--;
    yield ReduceAgeSuccessfully() ;
  }

  Stream<AppState> increaseMyWeight() async*{
    weight++;
    yield IncreaseWeightSuccessfully();
  }

  Stream<AppState> reduceMyWeight()async* {
    weight--;
    yield ReduceWeightSuccessfully() ;
  }
}
