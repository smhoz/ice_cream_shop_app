import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'core/init/notifier.dart/provider_list.dart';
import 'package:provider/provider.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/constants/app/app_constant.dart';
import 'core/init/theme/app_theme.dart';
import 'pages/home/page/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(
    providers: ProviderList.instance.providerItems,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.APP_TITLE,
      theme: AppTheme.instance.theme,
      navigatorKey: NavigationService.instance.navigatorKey,
      onGenerateRoute: NavigationRoute.instance.onGenerateRoute,
      home: const HomePage(),
    );
  }
}
