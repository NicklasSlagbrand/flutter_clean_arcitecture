import 'package:flutter/material.dart';
import 'package:flutter_app/features/github/list/github_list_bloc.dart';
import 'features/main/main_screen.dart';
import 'package:get_it/get_it.dart';
import 'data/http_service.dart';
import 'data/network/github_network_store.dart';
import 'domain/repository/github_repository_impl.dart';
import 'features/github/list/github_list_bloc.dart';

void main() {
  setupDi();

  runApp(MyApp());
}

void setupDi() {
  final getIt = GetIt.instance;

  getIt.registerSingleton(HttpService());

  getIt.registerSingleton(GithubNetworkStore(getIt.get()));
  getIt.registerSingleton(GithubRepositoryImpl(getIt.get()));

  getIt.registerFactory(() => GithubBloc(getIt.get()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      localeResolutionCallback:
          (Locale locale, Iterable<Locale> supportedLocales) {
        var defaultLocale = Locale.fromSubtags(languageCode: 'en');

        if (locale == null) {
          return defaultLocale;
        }

        for (final supportedLocale in supportedLocales) {
          // The language of the device of the user is compared to every supported language.
          // If the language codes match, the supported locale with that language code is chosen.
          // This allows users using American English or British English as locales
          // to be able to use the Belgian English localisation.
          if (locale.languageCode == supportedLocale.languageCode) {
            return supportedLocale;
          }
        }

        // If the language of the user isn't supported, the default locale should be used.
        return defaultLocale;
      },
      home: MainScreen(title: 'Flutter Demo Home Page'),
    );
  }
}
