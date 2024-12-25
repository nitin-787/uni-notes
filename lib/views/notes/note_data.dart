import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/config/size_config.dart';
import '/constants/colors.dart';
import '/constants/routes.dart';
import '/services/auth/auth_serivce.dart';
import '/services/cloud/cloud_note.dart';
import '/services/cloud/firebase_cloud_storgae.dart';
import '/views/notes/notes_list_view.dart';
import '/widget/popup.dart';

extension Count<T extends Iterable> on Stream<T> {
  Stream<int> get getLength => map((event) => event.length);
}

class NoteData extends StatefulWidget {
  const NoteData({super.key});

  @override
  State<NoteData> createState() => _NoteDataState();
}

class _NoteDataState extends State<NoteData> {
  late final FirebaseCloudStorage _notesService;
  String get userId => AuthService.firebase().currentUser!.id;

  @override
  void initState() {
    _notesService = FirebaseCloudStorage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: screenWidth(2),
        right: screenWidth(2),
      ),
      child: StreamBuilder(
        stream: _notesService.allNotes(ownerUserId: userId),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.active:
              if (snapshot.hasData) {
                final allNotes = snapshot.data as Iterable<CloudNote>;
                return NotesListView(
                  notes: allNotes,
                  onDeleteNote: (note) async {
                    await _notesService.deleteNote(documentId: note.documentId);
                  },
                  onTap: (note) {
                    Navigator.of(context).pushNamed(
                      createOrUpdateNoteRoute,
                      arguments: note,
                    );
                  },
                  onLongPress: (note) {
                    _openDeleteNotePopup(note);
                  },
                );
              } else {
                return const SizedBox(
                  height: 24,
                );
              }
            default:
              return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  _openDeleteNotePopup(CloudNote note) {
    showDialog(
      context: context,
      useSafeArea: true,
      builder: (context) {
        return Popup(
          title: 'Do you want to delete?',
          description: 'You can\'t restore this file',
          imagePath: 'assets/icon/warning.png',
          actions: [
            ElevatedButton(
              onPressed: () {
                deleteNote(note);
              },
              child: Text(
                'Delete',
                style: GoogleFonts.poppins(
                  fontSize: screenWidth(10),
                  color: AppColors.backgroundColor,
                ),
              ),
            ),
            const SizedBox(width: 6),
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  width: 1,
                  color: AppColors.mainColor,
                ),
              ),
              child: Text(
                'Cancel',
                style: GoogleFonts.poppins(
                  fontSize: screenWidth(10),
                  color: AppColors.mainColor,
                ),
              ),
            )
          ],
        );
      },
    );
  }

  deleteNote(CloudNote note) async {
    await _notesService.deleteNote(documentId: note.documentId).then((value) {
      if (!mounted) return;
      Navigator.pop(context);
      _noteDeleteSuccess();
    }).onError((error, stackTrace) {
      if (!mounted) return;
      Navigator.pop(context);
      _noteDeleteFailed();
    });
  }

  _noteDeleteSuccess() {
    showDialog(
      context: context,
      useSafeArea: true,
      builder: (context) {
        return Popup(
          title: 'File Deleted',
          description: 'That\'s all :)',
          imagePath: 'assets/icon/success.png',
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Okay, thank you',
                style: GoogleFonts.poppins(
                  fontSize: screenWidth(10),
                  color: AppColors.backgroundColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  _noteDeleteFailed() {
    showDialog(
      context: context,
      useSafeArea: true,
      builder: (context) {
        return Popup(
          title: 'Error',
          description: 'Sorry',
          imagePath: 'assets/icon/error.png',
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Okay',
                style: GoogleFonts.poppins(
                  fontSize: screenWidth(10),
                  color: AppColors.backgroundColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  comingSoon() {
    showDialog(
      context: context,
      useSafeArea: true,
      builder: (context) {
        return Popup(
          title: 'Sorry',
          description: 'This feature is commming soon!)',
          imagePath: 'assets/icon/success.png',
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Okay, thank you',
                style: GoogleFonts.poppins(
                  fontSize: screenWidth(10),
                  color: AppColors.backgroundColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
