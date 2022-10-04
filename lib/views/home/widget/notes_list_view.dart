import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynotes/config/size_config.dart';
import 'package:mynotes/constants/colors.dart';
import 'package:mynotes/services/cloud/cloud_note.dart';
import 'package:mynotes/helper/loading/shimmer_loading.dart';
import 'package:mynotes/views/home/widget/download.dart';


typedef NoteCallback = void Function(CloudNote note);

class NotesListView extends StatefulWidget {
  const NotesListView({
    Key? key,
    required this.notes,
    required this.onDeleteNote,
    required this.onTap,
  }) : super(key: key);

  final Iterable<CloudNote> notes;
  final NoteCallback onDeleteNote;
  final NoteCallback onTap;

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
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  const DownloadingDialog(),
                                            );

                                            //here download button will work on Pressing 
                                          },
                                          tooltip: 'Download File',
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
