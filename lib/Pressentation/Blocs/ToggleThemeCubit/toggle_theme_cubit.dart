

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'toggle_theme_state.dart';

class ToggleThemeCubit extends Cubit<ToggleThemeState> {
  ToggleThemeCubit() : super(ToggleThemeInitial());
  void toggleTheme() {
    if (state is ToggleThemeInitial) {
      emit(ToggleThemeDark());
      return;
    }
    if (state is ToggleThemeDark) {
      emit(ToggleThemeInitial());
      return;
    }
  }
}
