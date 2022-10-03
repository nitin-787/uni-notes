import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:velocity_x/velocity_x.dart';

class SkeletonNotes extends StatelessWidget {
  const SkeletonNotes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return buildShimmer();
      },
      itemCount: 5,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  Widget buildShimmer() => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Row(children: [
              const ShimmerWidget.circular(
                height: 100,
                width: 159,
                shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.zero,
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.zero)),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ShimmerWidget.rectangular(
                    height: 15,
                    width: 200,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const ShimmerWidget.rectangular(
                    height: 10,
                    width: 180,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: const [
                      ShimmerWidget.rectangular(
                        height: 10,
                        width: 150,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Icon(
                        CupertinoIcons.arrow_down_square,
                        color: Colors.grey,
                      )
                    ],
                  )
                ],
              ).px8())
            ])
          ],
        ),
      );
}

class ShimmerWidget extends StatelessWidget {
  final double height;
  final double width;
  final shapeBorder;

  const ShimmerWidget.rectangular({
    super.key,
    required this.width,
    required this.height,
  }) : shapeBorder = const RoundedRectangleBorder();

  const ShimmerWidget.circular({
    super.key,
    required this.height,
    required this.width,
    this.shapeBorder = const CircleBorder(),
  });

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: Colors.grey[400]!,
        highlightColor: Colors.grey[300]!,
        child: Container(
          width: width,
          height: height,
          decoration:
              ShapeDecoration(shape: shapeBorder, color: Colors.grey[400]!),
        ),
      );
}

class Skeleton extends StatelessWidget {
  const Skeleton({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double? height, width;
  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[400]!,
        child: Container(
          padding: const EdgeInsets.all(16),
          height: height,
          width: width,
          color: Colors.grey,
        ),
      );
}
