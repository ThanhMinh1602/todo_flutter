import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_flutter/services/local/shared_prefs.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(SharedPrefs.token ?? 'lỗi'),
      ),
    );
  }
}
