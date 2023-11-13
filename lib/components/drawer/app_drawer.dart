import 'package:flutter/material.dart';
import 'package:todo_flutter/screens/login_screen/login_screen.dart';
import 'package:todo_flutter/services/local/shared_prefs.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          TextButton(
            child: const Text('Logout'),
            onPressed: () {
              SharedPrefs.removeSeason();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                  (route) => false);
                  print('Thanh Minh: ${SharedPrefs.token}');
            },
          )
        ],
      ),
    );
  }
}
