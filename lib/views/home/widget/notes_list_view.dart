// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mynotes/config/size_config.dart';
import 'package:mynotes/constants/colors.dart';
import 'package:mynotes/services/cloud/cloud_note.dart';
import 'package:shimmer/shimmer.dart';

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
  late bool _isLoading;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
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
      listConatinerHeight = screenHeight(85.34);
    }

    return _isLoading
        ? const SkeletonNotesLenght()
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
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: screenHeight(9),
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
                                        height: screenHeight(6),
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

class SkeletonNotesLenght extends StatelessWidget {
  const SkeletonNotesLenght({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 10),
        SkeletonNotes(),
        SizedBox(height: 10),
        SkeletonNotes(),
        SizedBox(height: 10),
        SkeletonNotes(),
        SizedBox(height: 10),
        SkeletonNotes(),
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
    return Column(
      children: [
        const Padding(padding: EdgeInsets.all(10)),
        Row(
          children: [
            const Padding(padding: EdgeInsets.all(10)),
            const Skeleton(width: 120, height: 120),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Skeleton(width: 200, height: 11),
                SizedBox(
                  height: 19,
                ),
                Skeleton(width: 200, height: 11),
                SizedBox(
                  height: 19,
                ),
                Skeleton(width: 200, height: 11),
              ],
            ))
          ],
        )
      ],
    );
  }
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
