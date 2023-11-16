import 'package:flutter/material.dart';
import 'package:stickyheader/widgets/example1.dart';
import 'package:stickyheader/widgets/example2.dart';
import 'package:stickyheader/widgets/example3.dart';

@immutable
class Example4 extends StatefulWidget {
  const Example4({super.key});

  @override
  State<Example4> createState() => _Example4State();
}

class _Example4State extends State<Example4> {
  late final _controller = List.generate(4, (_) => ScrollController());

  @override
  Widget build(BuildContext context) {
    return Material(
      child: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          controller: _controller[0],
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: const Text('Example 4'),
                pinned: true,
                forceElevated: innerBoxIsScrolled,
                bottom: const TabBar(
                  tabs: <Tab>[
                    Tab(text: 'Example 1'),
                    Tab(text: 'Example 2'),
                    Tab(text: 'Example 3'),
                  ],
                ),
              ),
            ];
          },
          body: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: TabBarView(
              children: <Widget>[
                Example1(controller: _controller[1]),
                Example2(controller: _controller[2]),
                Example3(controller: _controller[3]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
