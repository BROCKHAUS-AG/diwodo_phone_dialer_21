import 'package:diwodo_21/app/models/buddy_manager.dart';
import 'package:diwodo_21/app/models/models.dart';
import 'package:diwodo_21/app/navigation/app_router.dart';
import 'package:diwodo_21/app/navigation/app_router_parser.dart';
import 'package:diwodo_21/dialer_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final _appStateManager = AppStateManager();
  final _buddyManager = BuddyManager();
  final routeParser = AppRouteParser();
  late AppRouter _appRouter;

  @override
  void initState() {
    _appRouter = AppRouter(
      appStateManager: _appStateManager,
      buddyManager: _buddyManager,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => _appStateManager,
        ),
        ChangeNotifierProvider(
          create: (context) => _buddyManager,
        ),
      ],
      child: Consumer<AppStateManager>(
        builder: (context, appStateManager, child) {
          ThemeData theme;
          if (appStateManager.isDarkTheme) {
            theme = DialerTheme.dark();
          } else {
            theme = DialerTheme.light();
          }
          return MaterialApp.router(
            theme: theme,
            title: 'diwodo Dialer App',
            backButtonDispatcher: RootBackButtonDispatcher(),
            routeInformationParser: routeParser,
            routerDelegate: _appRouter,
          );
        },
      ),
    );
  }
}
