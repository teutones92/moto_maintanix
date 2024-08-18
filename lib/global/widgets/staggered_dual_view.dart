import 'package:flutter/material.dart';

class StaggeredDualView extends StatelessWidget {
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final double spacing;
  final double aspectRatio;
  final double itemPercent;
  final ScrollPhysics? physics;

  const StaggeredDualView(
      {super.key,
      required this.itemBuilder,
      required this.itemCount,
      required this.itemPercent,
      this.physics = const BouncingScrollPhysics(),
      this.spacing = 0.0,
      this.aspectRatio = 0.5});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final itemHeight = (width * 0.5) / aspectRatio;
    return SizedBox(
      height: size.height / 2,
      width: size.width,
      child: GridView.builder(
        physics: physics,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: aspectRatio,
          crossAxisSpacing: spacing,
          mainAxisSpacing: spacing,
        ),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Transform.translate(
            offset: Offset(0.0, index.isOdd ? itemHeight * itemPercent : 0.0),
            child: itemBuilder(context, index),
          );
        },
      ),
    );
  }
}
