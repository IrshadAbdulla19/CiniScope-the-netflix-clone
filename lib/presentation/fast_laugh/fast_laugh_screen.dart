import 'package:flutter/material.dart';
import 'package:netflix_demo/presentation/fast_laugh/widgets/vedio_list_item.dart';

class FastLaughScreen extends StatelessWidget {
  const FastLaughScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: PageView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      children: List.generate(10, (index) {
        return VedioListItem(
          index: index,
        );
      }),
    )));
  }
}
