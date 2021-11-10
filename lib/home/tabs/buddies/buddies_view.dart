import 'package:diwodo_21/app/models/app_state_manager.dart';
import 'package:diwodo_21/app/models/buddy_manager.dart';
import 'package:diwodo_21/home/tabs/dialer/cubit/dialer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuddiesView extends StatelessWidget {
  const BuddiesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BuddyManager>(
      builder: (context, manager, child) {
        final buddies = manager.buddies;
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.separated(
            itemCount: buddies.length,
            itemBuilder: (context, index) {
              final item = buddies[index];
              return ListTile(
                key: Key(item.id.toString()),
                leading: buildAvatar(item.name),
                title: Text(item.name.toString()),
                subtitle: Text(item.number.toString()),
                onTap: () {
                  manager.buddyTapped(index);
                  Provider.of<AppStateManager>(context, listen: false).goToTab(HomeTab.dialPad);
                  context.read<DialerCubit>().addNumberFromContact(item.number.toString());
                },
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                thickness: 1.5,
                height: 1.5,
              );
            },
          ),
        );
      },
    );
  }

  Widget buildAvatar(String? name) {
    String extractFirstLetters() {
      var names = name!.split(' ');
      return names.first[0] + names.last[0];
    }

    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey,
      ),
      child: Center(child: Text(extractFirstLetters())),
    );
  }
}
