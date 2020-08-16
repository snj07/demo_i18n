import '../constants/global_enums.dart';
import '../models/app_locale_model.dart';
import 'global_app_config.dart';

class GlobalAppConstants {
  ///  To avoid accidentally instantiation using the implicit default constructor.
  GlobalAppConstants._();

  static const String appName = 'FlutterAppTemplate';

//  static const String baseUrl = "http://10.0.2.2:3001/"; // For emulator
//
  static const String baseUrl = "http://127.0.0.1:3001/";
  static const String i18Path = "assets/i18n";

  static const bool isDebug = GlobalAppConfig.kDebugMode;

  /// Default theme
  static AppTheme appTheme = AppTheme.LIGHT;

  /// Default app language and country code
  static AppLocaleModel appLocaleModel =
      new AppLocaleModel(languageCode: "en", countryCode: "US");

}
