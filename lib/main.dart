import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'shared/shared.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));

    return MultiBlocProvider(
      providers: BlocProviders().getProviders(),
      child: MaterialApp(
        title: Strings.appName,
        theme: LightTheme.themeData,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.login,
        onGenerateRoute: Routes.routes,
      ),
    );
  }
}
