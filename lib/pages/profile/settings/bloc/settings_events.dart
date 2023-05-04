abstract class SettingsEvents {
  const SettingsEvents();
}

class TriggerSettings extends SettingsEvents {
  final int index;
  TriggerSettings(this.index);
}
