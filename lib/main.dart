import 'package:demo_users/ui/tab1.dart';
import 'package:demo_users/ui/tab2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('User details'),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.person),
                  child: Text('Users'),
                ),
                Tab(
                  icon: Icon(Icons.bookmark),
                  child: Text('Bookmarked users'),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Tab1(),
              Tab2(),
            ],
          ),
        ),
      ),
    );
  }
}
