import 'package:flutter/material.dart';
import 'package:todo_flutter/components/appbar/custom_appbar.dart';
import 'package:todo_flutter/components/drawer/widgets/drawer_item.dart';
import 'package:todo_flutter/res/app_color.dart';
import 'package:todo_flutter/res/app_style.dart';
import 'package:todo_flutter/screens/login_screen/login_screen.dart';
import 'package:todo_flutter/services/local/shared_prefs.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Drawer(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Setting', icon: Icons.settings),
        body: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            TextButton(
              onPressed: () {
                SharedPrefs.removeSeason();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                    (route) => false);
              },
              child: const DrawerItem(
                icon: Icons.logout_outlined,
                label: 'Logout',
              ),
            )
          ],
        ),
      ),
    ));
  }
}
