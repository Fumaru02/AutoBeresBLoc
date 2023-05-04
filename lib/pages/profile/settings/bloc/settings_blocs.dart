import 'package:bloc_flutter/pages/profile/settings/bloc/setting_states.dart';
import 'package:bloc_flutter/pages/profile/settings/bloc/settings_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsBlocs extends Bloc<SettingsEvents, SettingsStates> {
  SettingsBlocs() : super(const SettingsStates()) {
    on<TriggerSettings>(_triggerSettings);
  }
  void _triggerSettings(TriggerSettings event, Emitter<SettingsStates> emit) {
    emit(state.copyWith(index: event.index));
  }
}
