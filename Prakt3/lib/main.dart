import 'package:flutter/material.dart';
import 'package:prak2/core/db/data_base_helper.dart';
import 'package:provider/provider.dart';

import 'app_router.dart';
import 'common/url_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DataBaseHelper.instance.init();
  Provider.debugCheckInvalidValueType = null;
  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  final AppRouter router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Color.fromARGB(255, 62, 42, 53),
        ),
          primarySwatch: Colors.red,
          fontFamily: 'Segoe UI',
          
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color.fromARGB(255, 56, 21, 40),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(color: Colors.black),
            backgroundColor: Color.fromARGB(255, 62, 42, 53),
          ),
        ),
      ),
      themeMode: ThemeMode.light,
      initialRoute: UrlPage.signIn,
      onGenerateRoute: router.generateRouter,
    );
  }
}
