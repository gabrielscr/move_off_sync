import 'package:flutter/material.dart';
import 'package:move_off_sync/app/app_home.dart';

class AppMain extends StatelessWidget {
  const AppMain({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Move Offline Sync',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const AppHome(),
    );
  }
}
