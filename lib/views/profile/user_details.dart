import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '/config/size_config.dart';
import '/constants/colors.dart';
import '/utilities/edit_image.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final _nameController = TextEditingController();
  final _collegeController = TextEditingController();
  final _branchController = TextEditingController();
  Uint8List? image;
  selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      image = img;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _collegeController.dispose();
    _branchController.dispose();
    super.dispose();
  }

  Future addUserDetails(
    String name,
    String college,
    String branch,
    Uint8List? image,
  ) async {
    await FirebaseFirestore.instance.collection('userData').add({
      'name': name,
      'college': college,
      'branch': branch,
      'image': image,
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor1,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.mainColor,
            ),
          ),
        ),
        body: Column(
          children: [
            Stack(
              children: [
                image != null
                    ? CircleAvatar(
                        radius: 80,
                        backgroundImage: MemoryImage(image!),
                      )
                    : CircleAvatar(
                        radius: 80,
                        backgroundColor: AppColors.mainColor,
                      ),
                Positioned(
                  bottom: -10,
                  left: 100,
                  child: IconButton(
                    onPressed: () {
                      selectImage();
                    },
                    icon: Icon(
                      Icons.add_a_photo,
                      color: AppColors.mainColor,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Marimo',
                style: TextStyle(
                  color: AppColors.textColor1,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: screenHeight(50),
              child: TextField(
                controller: _nameController,
                enableSuggestions: false,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintStyle: GoogleFonts.poppins(
                    color: AppColors.textColor2,
                  ),
                  hintText: 'Enter your name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(screenHeight(6.94)),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: screenHeight(50),
              child: TextField(
                controller: _collegeController,
                enableSuggestions: false,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintStyle: GoogleFonts.poppins(
                    color: AppColors.textColor2,
                  ),
                  hintText: 'Enter your college name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(screenHeight(6.94)),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: screenHeight(50),
              child: TextField(
                controller: _branchController,
                enableSuggestions: false,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintStyle: GoogleFonts.poppins(
                    color: AppColors.textColor2,
                  ),
                  hintText: 'Enter your branch',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(screenHeight(6.94)),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                addUserDetails(
                  _nameController.text,
                  _collegeController.text,
                  _branchController.text,
                  image,
                );
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
