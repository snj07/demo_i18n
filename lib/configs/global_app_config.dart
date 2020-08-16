import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart' as Foundation;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import '../blocs/global_bloc_observer.dart';
import '../constants/constants.dart';
import '../models/app_locale_model.dart';
import '../utils/common_utils.dart';

import '../utils/sp_utlis.dart';
import 'global_app_constants.dart';

class GlobalAppConfig {
  static const bool kDebugMode = Foundation.kDebugMode;
  static const bool kIsBlocObserverEnabled = true;
  static FlutterI18nDelegate flutterI18nDelegate;

  //Initialize flutter app
  static Future init(VoidCallback callback) async {
    // this should be called before accessing binary data before runApp()
    WidgetsFlutterBinding.ensureInitialized();
    if (kDebugMode) {
      // enable debug mode config for app


      // BlocSupervisor oversees Blocs and delegates to BlocDelegate.
      // We can set the BlocSupervisor's delegate to an instance of `SimpleBlocDelegate`.
      // This will allow us to handle all transitions and errors in SimpleBlocDelegate.
      if (kIsBlocObserverEnabled) {
        Bloc.observer = GlobalBlocObserver();
      }
    }
    await SpUtil.getInstance();
    // Get set language
    GlobalAppConstants.appLocaleModel =
        AppLocaleModel.fromJson(SpUtil.getObject(
              GlobalKeys.currentLocaleKey,
            )) ??
            GlobalAppConstants.appLocaleModel;

    // Get set theme
    GlobalAppConstants.appTheme = CommonUtils.enumFromString<AppTheme>(
        AppTheme.values,
        SpUtil.getString(GlobalKeys.currentThemeKey,
            defValue: GlobalAppConstants.appTheme.toString()));

    GlobalAppConfig.flutterI18nDelegate = FlutterI18nDelegate(
        useCountryCode: true,
        fallbackFile: 'en_US',
        path: GlobalAppConstants.i18Path,
        forcedLocale: Locale(GlobalAppConstants.appLocaleModel.languageCode,
            GlobalAppConstants.appLocaleModel.countryCode));

    if (Platform.isAndroid) {
      // set status bar color
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.white, // Color for Android
          statusBarBrightness: Brightness.dark));
    } else if (Platform.isIOS) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.grey,
          statusBarBrightness:
              Brightness.dark // Dark == white status bar -- for IOS.
          ));
    }
    callback();
  }
}
