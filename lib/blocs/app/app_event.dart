part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();
}

class ChangeThemeAppEvent extends AppEvent {
  final AppTheme theme;

  const ChangeThemeAppEvent({@required this.theme}) : assert(theme != null);

  @override
  List<Object> get props => [theme];
}

class ChangeLocaleAppEvent extends AppEvent {
  final AppLocaleModel appLocaleModel;

  const ChangeLocaleAppEvent({@required this.appLocaleModel})
      : assert(appLocaleModel != null);

  @override
  List<Object> get props => [appLocaleModel];
}
