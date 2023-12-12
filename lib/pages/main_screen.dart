// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sipayu/pages/home_screen.dart';
import 'package:sipayu/pages/settings_screen.dart';

class MainScreen extends StatefulHookConsumerWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<StatefulHookConsumerWidget> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  var pages = [
    const HomeScreen(),
    const SettingScreen(),
  ];

  int index = 0;

  void changeIndex(value) {
    setState(() {
      index = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    log(index.toString());
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) => changeIndex(value),
        selectedItemColor: Colors.red,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
