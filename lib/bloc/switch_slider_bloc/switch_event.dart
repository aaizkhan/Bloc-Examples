import 'package:equatable/equatable.dart';

abstract class SwitchEvent extends Equatable {
  const SwitchEvent();

  @override
  List<Object> get props => [];
}

class SwitchedClass extends SwitchEvent {
  bool isSwitch;
  SwitchedClass({required this.isSwitch});

  @override
  List<Object> get props => [isSwitch];
}

// ignore: must_be_immutable
class SliderClass extends SwitchEvent {
  double slider;
  SliderClass({required this.slider});

  @override
  List<Object> get props => [slider];
}
