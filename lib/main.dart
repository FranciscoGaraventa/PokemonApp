import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'src/config/route/app_routes.dart';
import 'src/config/route/named_route.dart';
import 'src/core/di.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then(
        (_) {
      runApp(MyApp());
    },
  );
}

class MyApp extends StatefulWidget {
  MyApp({Key? key})
      : _appRouter = AppRouter(),
        super(key: key);

  final AppRouter _appRouter;
  static const appTitle = 'Pokemon App';

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: NamedRoute.homeView,
      navigatorKey: Get.find<GlobalKey<NavigatorState>>(),
      onGenerateRoute: widget._appRouter.generatedRoutes,
      routes: widget._appRouter.routes,
      title: MyApp.appTitle,
    );
  }
}
