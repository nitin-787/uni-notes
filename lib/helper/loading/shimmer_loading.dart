import 'package:flutter/material.dart';
import 'package:mynotes/config/size_config.dart';
import 'package:mynotes/constants/colors.dart';
import 'package:shimmer/shimmer.dart';
import 'package:velocity_x/velocity_x.dart';

class SkeletonNotes extends StatelessWidget {
  const SkeletonNotes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.separated(
          controller: ScrollController(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return buildShimmer();
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemCount: 7,
        ),
      ),
    );
  }

  Widget buildShimmer() => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Row(
              children: [
                const ShimmerWidget.circular(
                  height: 133,
                  width: 160,
                  shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth(2),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ShimmerWidget.rectangular(
                        height: 15,
                        width: 190,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const ShimmerWidget.rectangular(
                        height: 10,
                        width: 170,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const ShimmerWidget.rectangular(
                            height: 10,
                            width: 150,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.file_download,
                            color: AppColors.textColor2,
                          ),
                        ],
                      )
                    ],
                  ).px8(),
                )
              ],
            )
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
        baseColor: AppColors.textColor2,
        highlightColor: Colors.grey[300]!,
        child: Container(
          width: width,
          height: height,
          decoration: ShapeDecoration(
            shape: shapeBorder,
            color: AppColors.textColor2,
          ),
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
          color: AppColors.textColor2,
        ),
      );
}
