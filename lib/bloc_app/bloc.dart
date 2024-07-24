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
    yield* _mapGenderSelectedToState(event.gender);

    }
    if (event is SliderValueChanged) {
      yield* _mapSliderValueChangedToState(event.value);

    }
    if (event is IncreaseAge) {
      yield* _mapIncreaseAgeToState();
    }
    if (event is ReduceAge) {
      yield* _mapReduceAgeToState();

    }
    if (event is IncreaseWeight) {
      yield* _mapIncreaseWeightToState();

    }
    if (event is ReduceWeight) {
      yield* _mapReduceWeightToState();
    }
  }


  Stream<AppState> _mapGenderSelectedToState(bool  ?gender) async* {
    try {
      await selectTypeGender(gender!);
      yield GenderSelectedSuccessfully();
    } catch (error) {
      yield GenderSelectedFailed();
    }
  }

  Stream<AppState> _mapSliderValueChangedToState(double ?value) async* {
    changeValueOfSlider(value);
    yield SliderValueChangedSuccessfully();
  }

  Stream<AppState> _mapIncreaseAgeToState() async* {
    increaseMyAge();
    yield IncreaseAgeSuccessfully();
  }

  Stream<AppState> _mapReduceAgeToState() async* {
    reduceMyAge();
    yield ReduceAgeSuccessfully();
  }

  Stream<AppState> _mapIncreaseWeightToState() async* {
    increaseMyWeight();
    yield IncreaseWeightSuccessfully();
  }

  Stream<AppState> _mapReduceWeightToState() async* {
    reduceMyWeight();
    yield ReduceWeightSuccessfully();
  }


selectTypeGender(bool value) async {
    isMale = value;
  }

   changeValueOfSlider(value) {
    number = value;

  }

   increaseMyAge()  {
    age++;

  }

    reduceMyAge() {
    age--;

  }

   increaseMyWeight() {
    weight++;
  }

   reduceMyWeight() {
    weight--;
  }
}
