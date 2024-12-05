import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ged_app/core/provider/document_provider.dart';
import 'package:ged_app/core/provider/user_provider.dart';
import 'package:ged_app/screens/auth/login/login_page.dart';
import 'package:ged_app/screens/home/home_screen.dart';
import 'package:ged_app/widgets/init.dart';
import 'package:provider/provider.dart';

class PostHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HttpOverrides.global = new PostHttpOverrides();

  //Bloquer en mode portrait
  //Mode paysage pas pris en compte
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProxyProvider<UserProvider, DocumentProvider>(
          create: (_) => DocumentProvider(),
          update: (_, userProvider, docProvider) =>
              docProvider!..updateUser(userProvider.userProfile),
        ),
      ],
      child: const MyApp(), //InitializationPage() //const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: const TextScaler.linear(1)),
      child: MaterialApp(
          title: 'GED APP',
          debugShowCheckedModeBanner: false,
          debugShowMaterialGrid: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home:
              const LoginPage() //HomeScreen() //LoginPage() //InitializationPage() //App(),
          ),
    );
  }
}
