class SettingsStates {
  const SettingsStates({this.index = 0});
  final int index;
  SettingsStates copyWith({int? index}) {
    return SettingsStates(index: index ?? this.index);
  }
}
