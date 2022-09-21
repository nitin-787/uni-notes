import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynotes/constants/colors.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/services/auth/auth_serivce.dart';
import 'package:mynotes/services/auth/bloc/auth_event.dart';
import 'package:mynotes/services/cloud/cloud_note.dart';
import 'package:mynotes/services/cloud/firebase_cloud_storgae.dart';
import 'package:mynotes/views/notes/new_notes_list_view.dart';

import '../../services/auth/bloc/auth_bloc.dart';

extension Count<T extends Iterable> on Stream<T> {
  Stream<int> get getLength => map((event) => event.length);
}

class NewNotesView extends StatefulWidget {
  const NewNotesView({super.key});

  @override
  State<NewNotesView> createState() => _NewNotesViewState();
}

class _NewNotesViewState extends State<NewNotesView> {
  late final FirebaseCloudStorage _notesService;
  String get userId => AuthService.firebase().currentUser!.id;

  @override
  void initState() {
    _notesService = FirebaseCloudStorage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatoing action button
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(createOrUpdateNoteRoute);
        },
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      // backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 22, right: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 60.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Hi, Nex",
                        style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: AppColors.mainColor,
                        ),
                      ),
                      // added temprory a logout button
                      const SizedBox(
                        width: 50,
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<AuthBloc>().add(
                                const AuthEventLogOut(),
                              );
                        },
                        icon: Icon(
                          Icons.logout,
                          color: AppColors.mainColor,
                        ),
                      ),
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage("assets/images/avatar.png"),
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Public Wall",
                          style: GoogleFonts.poppins(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: AppColors.mainColor,
                          ),
                        ),
                        Text(
                          "Private chat",
                          style: GoogleFonts.poppins(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: AppColors.mainColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 500,
                    height: 50,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: AppColors.searchBoxColor,
                        side: const BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {},
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.search,
                              color: AppColors.textColor1,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Search notes",
                              style: GoogleFonts.poppins(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textColor1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // List View builder
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: StreamBuilder(
                stream: _notesService.allNotes(ownerUserId: userId),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                    case ConnectionState.active:
                      if (snapshot.hasData) {
                        final allNotes = snapshot.data as Iterable<CloudNote>;
                        return NewNotesListView(
                          notes: allNotes,
                          onDeleteNote: (note) async {
                            await _notesService.deleteNote(
                                documentId: note.documentId);
                          },
                          onTap: (note) {
                            Navigator.of(context).pushNamed(
                              createOrUpdateNoteRoute,
                              arguments: note,
                            );
                          },
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    default:
                      return const CircularProgressIndicator();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
