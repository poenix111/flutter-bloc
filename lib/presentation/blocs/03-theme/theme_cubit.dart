import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({
    bool isDarkmode = false,
  }) : super(ThemeState(isDarkmode: isDarkmode));

  void toggleTheme() {
    emit(ThemeState(isDarkmode: !state.isDarkmode));
  }

  void setDarkmode() {
    emit(const ThemeState(isDarkmode: true));
  }

  void setLightmode() {
    emit(const ThemeState(isDarkmode: false));
  }
}
