import 'package:flutter/material.dart';
import 'Home/Home.dart';
import 'Chart/chart.dart';
import 'Preferences/preferences.dart';
import 'Read and Write/readwrite.dart';
import 'Riverpod/riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Charts',
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/chart': (context) => Chart(),
        '/preference' : (context) => Preferances(),
        '/ReadWrite' : (context) => ReadWrite(),
        '/riverpod': (context) => ProviderScope(
              child: RiverpodApp(),
            ),
        // '/widget' : (context) => getWidget()
      },
    );
  }
}
