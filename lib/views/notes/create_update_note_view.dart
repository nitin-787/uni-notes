import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:mynotes/constants/colors.dart';
import 'package:mynotes/extentions/buildcontext/loc.dart';
import 'package:mynotes/services/auth/auth_serivce.dart';
import 'package:mynotes/utilities/dialogs/cannot_share_empty_not_dialog.dart';
import 'package:mynotes/utilities/generic/get_argumnets.dart';
import 'package:mynotes/services/cloud/cloud_note.dart';
import 'package:mynotes/services/cloud/firebase_cloud_storgae.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/src/widgets/text.dart' as TextFlutter;

class CreateUpdateNoteView extends StatefulWidget {
  const CreateUpdateNoteView({Key? key}) : super(key: key);

  @override
  State<CreateUpdateNoteView> createState() => _CreateUpdateNoteViewState();
}

class _CreateUpdateNoteViewState extends State<CreateUpdateNoteView> {
  CloudNote? _note;
  late final FirebaseCloudStorage _notesSerivce;
  late final TextEditingController _textController;
  QuillController _quillController = QuillController.basic();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _notesSerivce = FirebaseCloudStorage();
    _textController = TextEditingController();
    super.initState();
  }

  void _textControllerListner() async {
    final note = _note;
    if (note == null) {
      return;
    }
    final text = _textController.text;
    await _notesSerivce.updateNote(
      documentId: note.documentId,
      text: text,
    );
  }

  void _setupTextControllerListner() {
    _textController.removeListener(_textControllerListner);
    _textController.addListener(_textControllerListner);
  }

  Future<CloudNote> createOrGetExistingNote(BuildContext context) async {
    final widgetNote = context.getArgument<CloudNote>();

    if (widgetNote != null) {
      _note = widgetNote;
      _textController.text = widgetNote.text;
      return widgetNote;
    }

    final existingNote = _note;
    if (existingNote != null) {
      return existingNote;
    }

    final currentUser = AuthService.firebase().currentUser!;
    final userId = currentUser.id;
    final newNote = await _notesSerivce.createNewNote(ownerUserId: userId);
    _note = newNote;
    return newNote;
  }

  void _deleteNoteIfTextIsEmpty() {
    final note = _note;
    if (_textController.text.isEmpty && note != null) {
      _notesSerivce.deleteNote(documentId: note.documentId);
    }
  }

  void _saveNoteIfTextIsEmpty() async {
    final note = _note;
    final text = _textController.text;
    if (note != null && text.isNotEmpty) {
      await _notesSerivce.updateNote(
        documentId: note.documentId,
        text: text,
      );
    }
  }

  @override
  void dispose() {
    _deleteNoteIfTextIsEmpty();
    _saveNoteIfTextIsEmpty();
    _textController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor1,
          leading: IconButton(
            icon:
                Icon(Icons.arrow_back_ios_rounded, color: AppColors.textColor),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            Center(
              child: TextFlutter.Text('Last Modified: 24/09/2022',
                  textAlign: TextAlign.end,
                  style: TextStyle(color: AppColors.textColor1, fontSize: 16)),
            ),
            const SizedBox(width: 10)
          ],
          shadowColor: Colors.transparent,
        ),
        body: SafeArea(
            child: Container(
                decoration: BoxDecoration(color: AppColors.backgroundColor1),
                // height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          TextField(
                              controller: _textController,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                hintText: "Title",
                              ),
                              style: TextStyle(fontSize: 24)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Container(
                        decoration:
                            BoxDecoration(color: AppColors.backgroundColor1),
                        child: QuillEditor(
                          controller: _quillController,
                          focusNode: _focusNode,
                          autoFocus: false,
                          scrollController: ScrollController(),
                          scrollable: true,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          readOnly: false,
                          expands: true,
                          placeholder: "Start typing...",
                        ),
                      ),
                    ),
                    QuillToolbar.basic(
                      controller: _quillController,
                      multiRowsDisplay: false,
                      dialogTheme: QuillDialogTheme(),
                    ),
                  ],
                )))
        // appBar: AppBar(
        //   title: Text(
        //     context.loc.note,
        //   ),
        //   actions: [
        //     IconButton(
        //       onPressed: () async {
        //         final text = _textController.text;
        //         if (_note == null || text.isEmpty) {
        //           await showCannotShareEmptyNoteDialog(context);
        //         } else {
        //           Share.share(text);
        //         }
        //       },
        //       icon: const Icon(Icons.share),
        //     ),
        //   ],
        // ),
        // body: FutureBuilder(
        //   future: createOrGetExistingNote(context),
        //   builder: (context, snapshot) {
        //     switch (snapshot.connectionState) {
        //       case ConnectionState.done:
        //         _setupTextControllerListner();
        //         return TextField(
        //           controller: _textController,
        //           keyboardType: TextInputType.multiline,
        //           maxLines: null,
        //           decoration: InputDecoration(
        //               hintText: context.loc.start_typing_your_note),
        //         );
        //       default:
        //         return const Center(
        //           child: CircularProgressIndicator(),
        //         );
        //     }
        //   },
        // ),
        );
  }
}
