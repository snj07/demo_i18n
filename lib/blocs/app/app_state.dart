part of "app_bloc.dart";

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

class AppInitial extends AppState {
  final String appLanguage;
  final AppTheme appTheme;

  const AppInitial({@required this.appLanguage, @required this.appTheme})
      : assert(appLanguage != null, appTheme != null);

  @override
  List<Object> get props => [appLanguage, appTheme];
}

class AppStarting extends AppState {
  //  final Weather weather;
//
//  const WeatherLoadSuccess({@required this.weather}) : assert(weather != null);
//
//  @override
//  List<Object> get props => [weather];

}

//class AppConfigUpdated extends AppState {
//  final Weather weather;
//
//  const WeatherLoadSuccess({@required this.weather}) : assert(weather != null);
//
//  @override
//  List<Object> get props => [weather];
//}

class AppLoading extends AppState {}

class AppLoaded extends AppState {
  final AppLocaleModel appLocaleModel;
  final AppTheme appTheme;

  const AppLoaded({@required this.appLocaleModel, @required this.appTheme})
      : assert(appLocaleModel != null && appTheme != null);

  @override
  List<Object> get props => [appLocaleModel, appTheme];
}
