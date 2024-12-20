import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_example/switch_example/bloc/switch_event.dart';
import 'package:flutter_bloc_example/switch_example/bloc/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchState()) {
    on<SwitchedClass>(_switchFun);
    on<SliderClass>(_sliderFun);
  }

  void _switchFun(SwitchedClass event, Emitter<SwitchState> emit) {
    emit(state.copyWith(isSwtich: !state.isSwitch));
  }

  void _sliderFun(SliderClass events, Emitter<SwitchState> emit) {
    emit(state.copyWith(slider: events.slider));
  }
}
