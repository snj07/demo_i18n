import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'blocs/blocs.dart';
import 'configs/global_app_config.dart';

void main() {
  GlobalAppConfig.init(() {
    runApp(BlocProvider(
        create: (BuildContext context) => AppBloc(), child: MyApp()));
  });
}
