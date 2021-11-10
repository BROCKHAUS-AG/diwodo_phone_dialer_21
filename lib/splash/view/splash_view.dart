import 'package:diwodo_21/app/models/models.dart';
import 'package:diwodo_21/app/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: Routes.splash,
      key: ValueKey(Routes.splash),
      child: const SplashView(),
    );
  }

  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<AppStateManager>(context, listen: false).initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image(
          image: AssetImage('assets/logo-diwodo-neu.png'),
        ),
      ),
    );
  }
}