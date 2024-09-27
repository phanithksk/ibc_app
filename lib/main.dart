import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ibc_app/router.dart';

import 'core/services/theme_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final storage = GetStorage();
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeService().lightTheme,
      darkTheme: ThemeService().darkTheme,
      themeMode: ThemeService().getThemeMode(),
      // translations: AppTranslations(),
      // fallbackLocale: AppTranslations().fallbackLocale,
      locale: storage.read('langCode') != null
          ? Locale(storage.read('langCode'), storage.read('countryCode'))
          : const Locale('km', 'KM'),
    );
  }
}
