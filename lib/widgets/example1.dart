import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:stickyheader/main.dart';
import 'package:stickyheader/widgets/scaffold_wrapper.dart';

@immutable
class Example1 extends StatelessWidget {
  const Example1({
    super.key,
    this.controller,
  });

  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      wrap: controller == null,
      title: 'Example 1',
      child: ListView.builder(
        primary: controller == null,
        controller: controller,
        itemBuilder: (context, index) {
          return StickyHeader(
            controller: controller, // Optional
            header: Container(
              height: 50.0,
              color: Colors.blueGrey[700],
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: Text(
                'Header #$index',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            content: Container(
              color: Colors.grey[300],
              child: Image.network(
                imageForIndex(index),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200.0,
              ),
            ),
          );
        },
      ),
    );
  }
}
