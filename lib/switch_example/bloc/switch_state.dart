import 'package:equatable/equatable.dart';

class SwitchState extends Equatable {
  final bool isSwitch;
  final double slider;
  const SwitchState({this.isSwitch = true, this.slider = 0.1});

  SwitchState copyWith({bool? isSwtich, double? slider}) {
    return SwitchState(isSwitch: isSwtich ?? isSwitch, slider: slider ?? 0.1);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [isSwitch, slider];
}
