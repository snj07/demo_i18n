import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import '../../configs/global_app_config.dart';

import '../../configs/global_app_constants.dart';
import '../../constants/constants.dart';
import '../../models/app_locale_model.dart';
import '../../utils/sp_utlis.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc()
      : super(AppLoaded(
            appLocaleModel: GlobalAppConstants.appLocaleModel,
            appTheme: GlobalAppConstants.appTheme));

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is ChangeThemeAppEvent) {
      yield* _handleChangeThemeEvent(event);
    } else if (event is ChangeLocaleAppEvent) {
      yield* _handleChangeLocaleAppEvent(event);
    }
  }

  AppLocaleModel _fetchCurrentAppLocale() {
    AppLocaleModel appLocaleModel = GlobalAppConstants.appLocaleModel;

    // Fetch current state's  app language
    if (state is AppLoaded) {
      var currentState = state as AppLoaded;
      appLocaleModel = currentState.appLocaleModel ?? appLocaleModel;
    }
    return appLocaleModel;
  }

  AppTheme _fetchCurrentAppTheme() {
    AppTheme appTheme = AppTheme.LIGHT;

    // Fetch current state's app theme and app language
    if (state is AppLoaded) {
      var currentState = state as AppLoaded;
      appTheme = currentState.appTheme ?? appTheme;
    }
    return appTheme;
  }

  Stream<AppState> _handleChangeThemeEvent(ChangeThemeAppEvent event) async* {
    yield AppLoading();
    AppLocaleModel appLocaleModel = _fetchCurrentAppLocale();
    SpUtil.putString(GlobalKeys.currentThemeKey, event.theme.toString());
    yield AppLoaded(appLocaleModel: appLocaleModel, appTheme: event.theme);
  }

  Stream<AppState> _handleChangeLocaleAppEvent(
      ChangeLocaleAppEvent event) async* {
    yield AppLoading();
    AppTheme currentTheme = _fetchCurrentAppTheme();
    GlobalAppConfig.flutterI18nDelegate = FlutterI18nDelegate(
        useCountryCode: true,
        fallbackFile: 'en_US',
        path: GlobalAppConstants.i18Path,
        forcedLocale: Locale(event.appLocaleModel.languageCode,
            event.appLocaleModel.countryCode));
    print(GlobalAppConfig.flutterI18nDelegate
        .isSupported(Locale(event.appLocaleModel.languageCode,
            event.appLocaleModel.countryCode))
        .toString());
    await GlobalAppConfig.flutterI18nDelegate.load(Locale(
        event.appLocaleModel.languageCode, event.appLocaleModel.countryCode));

//    FlutterI18n.refresh(, forcedLocale)
    yield AppLoaded(
        appLocaleModel: event.appLocaleModel, appTheme: currentTheme);
  }
}
