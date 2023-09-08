import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:pokemon/core/constants/app/application_constants.dart';
import 'package:pokemon/core/init/navigation/i_navigation_service.dart';
import 'package:pokemon/core/init/theme/i_theme_manager.dart';
import 'package:pokemon/product/init/language/language_manager.dart';
import 'package:pokemon/product/init/provider/application_provider.dart';
import 'package:pokemon/product/init/startup/startup_manager.dart';
import 'package:pokemon/product/providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await StartupManager.initialize();

  runApp(
    EasyLocalization(
      path: getIt<LanguageManager>().path,
      supportedLocales: getIt<LanguageManager>().supportedLocales,
      fallbackLocale: getIt<LanguageManager>().enLocale,
      child: MultiProvider(
        providers: ApplicationProvider.uiChangesItems,
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: ApplicationConstants.APP_NAME,
      theme: getIt<IThemeManager>().defaultTheme,
      themeMode: context.watch<ThemeProvider>().themeMode,
      routerDelegate: getIt<INavigationService>().routerDelegate(),
      routeInformationParser:
          getIt<INavigationService>().routeInformationParser(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
