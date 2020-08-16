import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import '../../blocs/app/app_bloc.dart';
import '../../constants/global_enums.dart';
import '../../models/app_locale_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 600,
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: [
          Row(
            children: [
              RaisedButton(
                onPressed: () => BlocProvider.of<AppBloc>(context)
                    .add(ChangeThemeAppEvent(theme: AppTheme.LIGHT)),
                child: Text(FlutterI18n.translate(
                    context, "login_page.button.light_theme")),
              ),
              RaisedButton(
                onPressed: () => BlocProvider.of<AppBloc>(context)
                    .add(ChangeThemeAppEvent(theme: AppTheme.DARK)),
                child: Text(FlutterI18n.translate(
                    context, "login_page.button.dark_theme")),
              )
            ],
          ),
          Row(
            children: [
              RaisedButton(
                onPressed: () => BlocProvider.of<AppBloc>(context).add(
                    ChangeLocaleAppEvent(
                        appLocaleModel: AppLocaleModel(
                            countryCode: "IN", languageCode: "hi"))),
                child: Text(FlutterI18n.translate(
                    context, "login_page.button.hindi_language")),
              ),
              RaisedButton(
                onPressed: () => BlocProvider.of<AppBloc>(context).add(
                    ChangeLocaleAppEvent(
                        appLocaleModel: AppLocaleModel(
                            countryCode: "US", languageCode: "en"))),
                child: Text(FlutterI18n.translate(
                    context, "login_page.button.english_language")),
              )
            ],
          )
        ],
      ),
    );
  }
}
