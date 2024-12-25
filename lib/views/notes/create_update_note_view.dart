import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';

import '/config/size_config.dart';
import '/constants/colors.dart';
import '/extentions/buildcontext/loc.dart';
import '/services/auth/auth_serivce.dart';
import '/utilities/dialogs/cannot_share_empty_not_dialog.dart';
import '/utilities/generic/get_argumnets.dart';
import '/services/cloud/cloud_note.dart';
import '/services/cloud/firebase_cloud_storgae.dart';

class CreateUpdateNoteView extends StatefulWidget {
  const CreateUpdateNoteView({super.key});

  @override
  State<CreateUpdateNoteView> createState() => _CreateUpdateNoteViewState();
}

class _CreateUpdateNoteViewState extends State<CreateUpdateNoteView>
    with SingleTickerProviderStateMixin {
  CloudNote? _note;
  late final FirebaseCloudStorage _notesSerivce;
  late final TextEditingController _textController;
  File? _file;
  ImagePicker image = ImagePicker();
  String url = "";
  var name = "";
  PlatformFile? _platformFile;
  late AnimationController loadingController;
  bool isuploaded = false;

  @override
  void initState() {
    loadingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..addListener(() {
        setState(() {});
      });

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
      backgroundColor: AppColors.backgroundColor1,
      appBar: AppBar(
        // back icon
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          context.loc.note,
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final text = _textController.text;
              if (_note == null || text.isEmpty) {
                await showCannotShareEmptyNoteDialog(context);
              } else {
                Share.share(text);
              }
            },
            icon: const Icon(Icons.share),
          ),
        ],
      ),
      body: FutureBuilder(
        future: createOrGetExistingNote(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            _setupTextControllerListner();
            return Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(
                    controller: _textController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                        hintText: context.loc.start_typing_your_note),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  GestureDetector(
                    onTap: getfile,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 20.0),
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(10),
                        dashPattern: const [10, 4],
                        strokeCap: StrokeCap.round,
                        color: Colors.blue.shade400,
                        child: Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade50.withValues(),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Iconsax.folder_open,
                                color: Colors.blue,
                                size: 40,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Select your file',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: AppColors.textColor1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  _platformFile != null
                      ? Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Selected File:',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade200,
                                        offset: const Offset(0, 1),
                                        blurRadius: 3,
                                        spreadRadius: 2,
                                      )
                                    ]),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.file(
                                          _file!,
                                          width: 70,
                                        )),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            _platformFile!.name,
                                            style: const TextStyle(
                                                fontSize: 13,
                                                color: Colors.black),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '${(_platformFile!.size / 1024).ceil()} KB',
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey.shade500),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                              height: 5,
                                              clipBehavior: Clip.hardEdge,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.blue.shade50,
                                              ),
                                              child: LinearProgressIndicator(
                                                value: loadingController.value,
                                              )),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(),
                  const Spacer(
                    flex: 2,
                  ),
                  SizedBox(
                    height: screenWidth(29.7),
                    width: screenWidth(170.7),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: AppColors.mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(screenHeight(20.86)),
                        ),
                      ),
                      onPressed: () async {
                        await uploadFile();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: screenWidth(9.86),
                          ),
                          Text(
                            "Upload Note",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: screenWidth(12.51),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          // need to fixed
          return Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: _textController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                      hintText: context.loc.start_typing_your_note),
                ),
                const Spacer(
                  flex: 1,
                ),
                GestureDetector(
                  onTap: getfile,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 20.0),
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(10),
                      dashPattern: const [10, 4],
                      strokeCap: StrokeCap.round,
                      color: Colors.blue.shade400,
                      child: Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.blue.shade50.withValues(),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Iconsax.folder_open,
                              color: Colors.blue,
                              size: 40,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Select your file',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey.shade400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                _platformFile != null
                    ? Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Selected File:',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey.shade400,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade200,
                                      offset: const Offset(0, 1),
                                      blurRadius: 3,
                                      spreadRadius: 2,
                                    )
                                  ]),
                              child: Row(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.file(
                                        _file!,
                                        width: 70,
                                      )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _platformFile!.name,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              color: Colors.black),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '${(_platformFile!.size / 1024).ceil()} KB',
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey.shade500),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                            height: 5,
                                            clipBehavior: Clip.hardEdge,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.blue.shade50,
                                            ),
                                            child: LinearProgressIndicator(
                                              value: loadingController.value,
                                            )),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(),
                const Spacer(
                  flex: 2,
                ),
                SizedBox(
                  height: screenWidth(29.7),
                  width: screenWidth(170.7),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: AppColors.mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(screenHeight(20.86)),
                      ),
                    ),
                    onPressed: () async {
                      await uploadFile();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: screenWidth(9.86),
                        ),
                        Text(
                          "Upload Note",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: screenWidth(12.51),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  getfile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'png' 'jpg', 'jpeg'],
    );

    if (result != null) {
      setState(() {
        _file = File(result.files.single.path!);
        _platformFile = result.files.first;
      });
    }

    loadingController.forward();
  }

  getImage() async {
    var img = await image.pickImage(source: ImageSource.gallery);
    setState(() {
      _file = File(img!.path);
    });
    if (_file != null) {
      uploadFile();
    }
  }

  uploadFile() async {
    if (_file != null) {
      isuploaded = true;
      var fileName = _file!.path.split('/').last;
      var destination = 'notes/$fileName';
      var storageReference = FirebaseStorage.instance.ref(destination);
      var uploadTask = storageReference.putFile(_file!);
      var taskSnapshot = await uploadTask;
      taskSnapshot.ref.getDownloadURL().then(
            (value) {},
          );

      setState(() {
        loadingController.reverse();
      });

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: CustomSnackBar(
          errorText: 'File Uploaded',
          headingText: 'Success',
          color: const Color.fromARGB(255, 29, 164, 31),
          image: Image.asset(
            'assets/icon/error_solid_green.png',
            height: 35,
            width: 35,
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ));
      // add duration
      Future.delayed(const Duration(seconds: 3), () {
        if (!mounted) return;
        Navigator.pop(context);
      });
    } else {
      isuploaded = false;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: CustomSnackBar(
            errorText: 'No file selected',
            headingText: 'Oh Snap!',
            color: const Color(0xFFF75469),
            image: Image.asset('assets/icon/error_solid.png'),
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      );
    }
  }
}

class CustomSnackBar extends StatelessWidget {
  const CustomSnackBar({
    super.key,
    required this.errorText,
    required this.headingText,
    required this.color,
    required this.image,
  });

  final String errorText, headingText;
  final Color? color;
  final Image? image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          height: 90,
          child: Row(
            children: [
              const SizedBox(
                width: 48,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      headingText,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      errorText,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
            ),
            child: Stack(
              children: [
                SvgPicture.asset(
                  'assets/icon/test.svg',
                  height: 48,
                  width: 40,
                  // ignore: deprecated_member_use
                  color: Colors.transparent,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -20,
          left: 12,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image(
                image: image!.image,
                height: 35,
                width: 35,
              ),
              Positioned(
                top: 10,
                child: SvgPicture.asset(
                  'assets/icon/vhat.svg',
                  height: 16,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
    // try {
    //   var imagefile =
    //       FirebaseStorage.instance.ref().child("Users").child("/$name");
    //   UploadTask task = imagefile.putFile(_file!);
    //   TaskSnapshot snapshot = await task;
    //   url = await snapshot.ref.getDownloadURL();

  //     print(url);
  //     if (_file != null) {
  //       Fluttertoast.showToast(
  //         msg: "file uloaded sucessfully",
  //         textColor: Colors.grey,
  //       );
  //     } else {
  //       Fluttertoast.showToast(
  //         msg: "Something went wrong",
  //         textColor: Colors.red,
  //       );
  //     }
  //   } on Exception catch (e) {
  //     Fluttertoast.showToast(
  //       msg: e.toString(),
  //       textColor: Colors.grey,
  //     );
  //   }
  // }
