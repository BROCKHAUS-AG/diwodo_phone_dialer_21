import 'package:diwodo_21/app/models/app_state_manager.dart';
import 'package:diwodo_21/app/navigation/routes.dart';
import 'package:diwodo_21/home/tabs/dialer/cubit/dialer_cubit.dart';
import 'package:diwodo_21/home/tabs/tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  static MaterialPage page(int currentTab) {
    return MaterialPage(
      name: Routes.home,
      key: ValueKey(Routes.home),
      child: HomeView(currentTab: currentTab),
    );
  }

  const HomeView({
    Key? key,
    required this.currentTab,
  }) : super(key: key);

  final int currentTab;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  static List<Widget> pages = [
    const Dialer(),
    const BuddiesView(),
    const SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateManager>(
        builder: (context, appStateManager, child) {
          return BlocProvider(
            create: (_) => DialerCubit(),
            child: Scaffold(
              body: IndexedStack(
                index: widget.currentTab,
                children: pages,
              ),
              bottomNavigationBar: bottomNavBar(),
            ),
          );
        });
  }

  Widget bottomNavBar() {
    return BottomNavigationBar(
      selectedItemColor: Theme
          .of(context)
          .textSelectionTheme
          .selectionColor,
      currentIndex: widget.currentTab,
      onTap: (index) {
        Provider.of<AppStateManager>(context, listen: false).goToTab(index);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.dialpad),
          label: 'Tasten',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'Buddies',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Einstellung',
        ),
      ],
    );
  }
}
