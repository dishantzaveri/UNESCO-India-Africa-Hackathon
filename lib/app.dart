import 'package:flutter/material.dart';
import 'package:partograph/provider/auth_provider.dart';
import 'package:partograph/provider/heart_rate_provider.dart';
import 'package:partograph/provider/mother_provider.dart';
import 'package:partograph/provider/utility_provider.dart';
import 'package:partograph/routes/routes.dart';
import 'package:partograph/ui/pages/home/home_page.dart';
import 'package:partograph/ui/pages/loader_screen.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.theme, required this.darkTheme})
      : super(key: key);
  final ThemeData theme;
  final ThemeData darkTheme;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => AuthProvider()..autoAuthenticate()),
        ChangeNotifierProvider(create: (_) => UtilityProvider()),
        ChangeNotifierProvider(create: (_) => HeartRateProvider()),
        ChangeNotifierProvider(create: (_) => MotherProvider()),
      ],
      child: MaterialApp(
          title: 'Partograph',
          debugShowCheckedModeBanner: false,
          theme: theme,
          darkTheme: darkTheme,
          home: const AnimatedLoaderScreen(),
          routes: {
            homePageRouteAndroid: (context) => const HomePage(),
            loginPageRouteAndroid: (context) => const HomePage(),
          }),
    );
  }
}
