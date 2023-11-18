import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/app_provider/app_provider.dart';
import 'package:news_app/screens/home_screen/home_screen.dart';
import 'package:news_app/screens/home_screen/tabs/news_tab/news_details_screen.dart';
import 'package:news_app/screens/home_screen/tabs/news_tab/news_tab_view_model.dart';
import 'package:news_app/screens/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
      create:(_) => AppProvider(),
      child: const MyApp()));

}

  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
      AppProvider appProvider = Provider.of<AppProvider>(context);
      return MaterialApp(
        title: 'Localizations Sample App',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale(appProvider.currentLocale),
        initialRoute: SplashScreen.routeName,
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          SplashScreen.routeName: (context) => const SplashScreen(),
          NewsDetailsScreen.routeName :(context) => const NewsDetailsScreen()
        },
        debugShowCheckedModeBanner: false,

      );

    }


}
