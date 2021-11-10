import 'package:diwodo_21/app/models/app_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: buildDarkModeToggle(),
      );
  }

  Widget buildDarkModeToggle() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Dunkles Design'),
          Switch(
            value: Provider.of<AppStateManager>(context, listen: true).isDarkTheme,
            onChanged: (value) {
              Provider.of<AppStateManager>(context, listen: false).isDarkTheme =
                  value;
            },
          ),
        ],
      ),
    );
  }
}
