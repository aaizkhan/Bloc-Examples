import 'package:equatable/equatable.dart';

class SwitchState extends Equatable {
  final bool isSwitch;
  final double slider;
  final bool switchValue;

  const SwitchState(
      {this.isSwitch = true, this.slider = 0.1, this.switchValue = false});

  SwitchState copyWith({bool? isSwtich, double? slider}) {
    return SwitchState(
        isSwitch: isSwtich ?? isSwitch,
        slider: slider ?? 0.1,
        switchValue: switchValue);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [isSwitch, slider, switchValue];
}
