import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynotes/config/size_config.dart';
import 'package:mynotes/constants/colors.dart';
import 'package:mynotes/services/cloud/cloud_note.dart';

typedef NoteCallback = void Function(CloudNote note);

class NewNotesListView extends StatelessWidget {
  final Iterable<CloudNote> notes;
  final NoteCallback onDeleteNote;
  final NoteCallback onTap;

  const NewNotesListView({
    Key? key,
    required this.notes,
    required this.onDeleteNote,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double listConatinerHeight;
    var height = MediaQuery.of(context).size.height;
    if (height < 600) {
      listConatinerHeight = screenHeight(113.34);
    } else {
      listConatinerHeight = screenHeight(85.34);
    }
    return ListView.builder(
      controller: ScrollController(),
      shrinkWrap: true,
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final note = notes.elementAt(index);
        return Column(
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Colors.transparent,
                ),
              ),
              onPressed: () {
                onTap(note);
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
                      width: screenWidth(13.2),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: screenHeight(9.88),
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
                            height: screenHeight(4.88),
                          ),
                          Text(
                            "By: Nex-kun",
                            style: GoogleFonts.poppins(
                              fontSize: screenWidth(11.11),
                              fontWeight: FontWeight.w500,
                              color: AppColors.textColor2,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "December 22, 23:54",
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
    );
  }
}
