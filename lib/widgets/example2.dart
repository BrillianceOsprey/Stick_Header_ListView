import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:stickyheader/images.dart';
import 'package:stickyheader/widgets/scaffold_wrapper.dart';

@immutable
class Example2 extends StatelessWidget {
  const Example2({
    super.key,
    this.controller,
  });

  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      wrap: controller == null,
      title: 'Example 2',
      child: ListView.builder(
        primary: controller == null,
        controller: controller,
        itemBuilder: (context, index) {
          return StickyHeaderBuilder(
            controller: controller, // Optional
            builder: (BuildContext context, double stuckAmount) {
              stuckAmount = 1.0 - stuckAmount.clamp(0.0, 1.0);
              return Container(
                height: 50.0,
                color:
                    Color.lerp(Colors.blue[700], Colors.red[700], stuckAmount),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        'Header #$index',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    Offstage(
                      offstage: stuckAmount <= 0.0,
                      child: Opacity(
                        opacity: stuckAmount,
                        child: IconButton(
                          icon: const Icon(Icons.favorite, color: Colors.white),
                          onPressed: () => ScaffoldMessenger.of(context)
                              .showSnackBar(
                                  SnackBar(content: Text('Favorite #$index'))),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
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

  String imageForIndex(int index) {
    return Images.imageThumbUrls[index % Images.imageThumbUrls.length];
  }
}
