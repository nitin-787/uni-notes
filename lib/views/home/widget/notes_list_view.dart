// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mynotes/config/size_config.dart';
import 'package:mynotes/constants/colors.dart';
import 'package:mynotes/services/cloud/cloud_note.dart';
import 'package:shimmer/shimmer.dart';
import 'package:velocity_x/velocity_x.dart';

typedef NoteCallback = void Function(CloudNote note);

class NotesListView extends StatefulWidget {
  final Iterable<CloudNote> notes;
  final NoteCallback onDeleteNote;
  final NoteCallback onTap;

  const NotesListView({
    Key? key,
    required this.notes,
    required this.onDeleteNote,
    required this.onTap,
  }) : super(key: key);

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  static late bool _isLoading = true;

  @override
  void initState() {
    super.initState();


    if (_isLoading == false) {
      _isLoading = false;
    } else {
      _isLoading = true;
    }


    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double listConatinerHeight;
    var height = MediaQuery.of(context).size.height;
    if (height < 600) {
      listConatinerHeight = screenHeight(113.34);
    } else {
      listConatinerHeight = screenHeight(87.34);
    }

    return _isLoading

        ? const SkeletonNotes()

        : Column(
            children: [
              ListView.builder(
                controller: ScrollController(),
                shrinkWrap: true,
                itemCount: widget.notes.length,
                itemBuilder: (context, index) {
                  final note = widget.notes.elementAt(index);
                  return Column(
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        onPressed: () {
                          widget.onTap(note);
                        },
                        child: Container(
                          height: listConatinerHeight,
                          margin: EdgeInsets.only(
                            bottom: screenWidth(13.2),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: screenWidth(85.6),
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fitWidth,
                                    image: AssetImage(
                                      "assets/images/avatar.png",
                                    ),
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: screenWidth(16),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: screenHeight(6),

                                    ),
                                    Text(
                                      note.text,
                                      maxLines: 1,
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                        fontSize: screenWidth(12),
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.textColor,
                                      ),
                                    ),
                                    SizedBox(

                                      height: screenHeight(3),

                                     

                                    ),
                                    Text(
                                      "By: Nex-kun",
                                      style: GoogleFonts.poppins(
                                        fontSize: screenWidth(10),
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.textColor2,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          note.dateTime,
                                          style: GoogleFonts.poppins(
                                            fontSize: screenWidth(10),
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.textColor2,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.file_download,
                                            color: AppColors.mainColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          );
  }

}

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

  const ShimmerWidget.rectangular({required this.width, required this.height})
      : this.shapeBorder = const RoundedRectangleBorder();

  const ShimmerWidget.circular({
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
