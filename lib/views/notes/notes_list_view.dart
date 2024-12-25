import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '/config/size_config.dart';
import '/constants/colors.dart';
import '/services/cloud/cloud_note.dart';
import '/helper/loading/shimmer_loading.dart';
import '/widget/download.dart';

typedef NoteCallback = void Function(CloudNote note);
typedef NoteLongPressCallback = void Function(CloudNote note);

class NotesListView extends StatefulWidget {
  const NotesListView({
    super.key,
    required this.notes,
    required this.onDeleteNote,
    required this.onTap,
    required this.onLongPress,
  });

  final Iterable<CloudNote> notes;
  final NoteCallback onDeleteNote;
  final NoteCallback onTap;
  final NoteLongPressCallback onLongPress;

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  static bool _isLoading = true;

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
      listConatinerHeight = screenHeight(112.34);
    } else {
      listConatinerHeight = screenHeight(82.34);
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
                        onLongPress: () {
                          widget.onLongPress(note);
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
                                      height: screenHeight(5),
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
                                    const Spacer(),
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
                                        const Spacer(),
                                        IconButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  const DownloadingDialog(),
                                            );
                                          },
                                          tooltip: 'Download File',
                                          icon: Icon(
                                            Iconsax.document_download,
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
