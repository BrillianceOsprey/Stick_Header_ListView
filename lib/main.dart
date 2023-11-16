import 'package:flutter/material.dart';
import 'package:stickyheader/widgets/example1.dart';
import 'package:stickyheader/widgets/example2.dart';
import 'package:stickyheader/widgets/example3.dart';
import 'package:stickyheader/widgets/example4.dart';
import 'package:stickyheader/widgets/scaffold_wrapper.dart';

import './images.dart';

void main() => runApp(const MyApp());

@immutable
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sticky Headers Example',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MainScreen(),
    );
  }
}

@immutable
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      title: 'Sticky Headers Example',
      child: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: <Widget>[
            ListTile(
              title: const Text('Example 1 - Headers and Content'),
              onTap: () => navigateTo(context, (context) => const Example1()),
            ),
            ListTile(
              title: const Text('Example 2 - Animated Headers with Content'),
              onTap: () => navigateTo(context, (context) => const Example2()),
            ),
            ListTile(
              title: const Text('Example 3 - Headers overlapping the Content'),
              onTap: () => navigateTo(context, (context) => const Example3()),
            ),
            ListTile(
              title: const Text('Example 4 - Example using scroll controller'),
              onTap: () => navigateTo(context, (context) => const Example4()),
            ),
          ],
        ).toList(growable: false),
      ),
    );
  }

  void navigateTo(BuildContext context, WidgetBuilder builder) {
    Navigator.of(context).push(MaterialPageRoute(builder: builder));
  }
}

String imageForIndex(int index) {
  return Images.imageThumbUrls[index % Images.imageThumbUrls.length];
}
