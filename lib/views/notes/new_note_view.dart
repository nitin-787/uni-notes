import 'package:flutter/material.dart';
import 'package:mynotes/services/auth/auth_serivce.dart';
import 'package:mynotes/services/crud/notes_serivce.dart';

class NewNoteView extends StatefulWidget {
  const NewNoteView({Key? key}) : super(key: key);

  @override
  State<NewNoteView> createState() => _NewNoteViewState();
}

class _NewNoteViewState extends State<NewNoteView> {
  DatabaseNote? _note;
  late final NotesSerivce _notesSerivce;
  late final TextEditingController _textController;

  @override
  void initState() {
    _notesSerivce = NotesSerivce();
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
      note: note,
      text: text,
    );
  }

  void _setupTextControllerListner() {
    _textController.removeListener(_textControllerListner);
    _textController.addListener(_textControllerListner);
  }

  Future<DatabaseNote> createNewNote() async {
    final existingNote = _note;
    if (existingNote != null) {
      return existingNote;
    }

    final currentUser = AuthService.firebase().currentUser!;
    final email = currentUser.email!;
    final owner = await _notesSerivce.getUser(email: email);
    return await _notesSerivce.createNote(owner: owner);
  }

  void _deleteNoteIfTextIsEmpty() {
    final note = _note;
    if (_textController.text.isEmpty && note != null) {
      _notesSerivce.deleteNote(id: note.id);
    }
  }

  void _saveNoteIfTextIsEmpty() async {
    final note = _note;
    final text = _textController.text;
    if (note != null && text.isNotEmpty) {
      await _notesSerivce.updateNote(
        note: note,
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
        title: const Text('New Note'),
      ),
      body: FutureBuilder(
        future: createNewNote(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              _note = snapshot.data as DatabaseNote;
              _setupTextControllerListner();
              return TextField(
                controller: _textController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                    hintText: 'Start typing your notes...'),
              );
            default:
              return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
