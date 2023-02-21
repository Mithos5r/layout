import 'package:flutter/material.dart';

import 'layout/layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Material(
        child: Layout(
            appbar: Container(
              height: 70,
              width: double.infinity,
              color: Colors.red,
              child: const Text(
                'Esto es el appbar',
                style: TextStyle(fontSize: 20),
              ),
            ),
            bottonNavigation: Container(
              height: 70,
              width: double.infinity,
              color: Colors.blue,
              child: const Text(
                'NavigationBar',
                style: TextStyle(fontSize: 20),
              ),
            ),
            bottomSheet: Container(
              height: 20,
              width: double.infinity,
              color: Colors.amber,
              child: const Text(
                'BottomSheet',
                style: TextStyle(fontSize: 20),
              ),
            ),
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    height: 50,
                    width: 50,
                    color: Colors.purple,
                  ),
                )
              ],
            )),
      ),
      color: Colors.purple,
    );
  }
}
