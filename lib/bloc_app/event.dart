abstract class AppEvent {}

class GenderSelected extends AppEvent{
   bool? gender;
  GenderSelected(this.gender);
}
class SliderValueChanged extends AppEvent{
   double? value;
  SliderValueChanged(this.value);
}
class IncreaseAge extends AppEvent{}
class ReduceAge extends AppEvent{}
class IncreaseWeight extends AppEvent{}
class ReduceWeight extends AppEvent{}

