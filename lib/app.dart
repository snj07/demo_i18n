import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import './configs/global_app_config.dart';
import './configs/global_app_constants.dart';
import './constants/constants.dart';
import './models/app_locale_model.dart';
import './screens/login/login.dart';
import './theme/app_theme.dart';
import 'blocs/blocs.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
//    FlutterI18n.refresh(context, GlobalAppConfig.flutterI18nDelegate.forcedLocale);
    return BlocBuilder<AppBloc, AppState>(builder: (context, state) {
      // return widget here based on BlocA's state
      AppTheme appTheme = GlobalAppConstants.appTheme;
      AppLocaleModel appLocaleModel = GlobalAppConstants.appLocaleModel;
      if (state is AppLoaded) {
        appTheme = state.appTheme;
        appLocaleModel = state.appLocaleModel;
      }

      return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        //i18n stuff
        supportedLocales: [Locale("en", "US"), Locale("hi", "IN")],
        localizationsDelegates: [
          GlobalAppConfig.flutterI18nDelegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        //howPerformanceOverlay: true,
        theme:
            appTheme == AppTheme.LIGHT ? buildLightTheme() : buildDarkTheme(),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
//    FlutterI18n.refresh(context, GlobalAppConfig.flutterI18nDelegate.forcedLocale);
//    FlutterI18n.refresh(context, Locale(appLocaleModel.languageCode,appLocaleModel.countryCode));
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: LoginScreen(),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
