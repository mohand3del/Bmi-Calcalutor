import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../local/local_data.dart';

part 'theme_cubit_state.dart';

class ThemeCubit extends Cubit<ThemeCubitState> {
  ThemeCubit() : super(ThemeCubitInitial());

  static ThemeCubit of(BuildContext context) =>
      BlocProvider.of<ThemeCubit>(context);

  Future<void> switchTheme() async {
    await LocalData.switchThemeMode();
    emit(ThemeCubitChanged());
  }
}