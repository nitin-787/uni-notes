import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mynotes/config/size_config.dart';
import 'package:mynotes/constants/colors.dart';
import 'package:mynotes/utilities/dialogs/comming_soon.dart';

import '../../utilities/edit_image.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  Uint8List? image;
  selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                image != null
                    ? CircleAvatar(
                        radius: 80, backgroundImage: MemoryImage(image!))
                    : const CircleAvatar(
                        radius: 80,
                        backgroundImage: AssetImage('assets/images/zoro.png'),
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
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 10,
              ),
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: ListTile.divideTiles(context: context, tiles: [
                  ProfileDetails(
                    icon: Icons.account_circle,
                    text: 'Personal Details',
                    onPressed: () {
                      commingSoon(context);
                    },
                  ),
                  ProfileDetails(
                    icon: Icons.notes,
                    text: 'Draft Notes',
                    onPressed: () {
                      commingSoon(context);
                    },
                  ),
                  ProfileDetails(
                    icon: Icons.delete,
                    text: 'Trashed',
                    onPressed: () {
                      commingSoon(context);
                    },
                  ),
                  ProfileDetails(
                    icon: Icons.info,
                    text: 'About',
                    onPressed: () {
                      commingSoon(context);
                    },
                  ),
                  ProfileDetails(
                    icon: Icons.help,
                    text: 'Help',
                    onPressed: () {
                      commingSoon(context);
                    },
                  ),
                  ProfileDetails(
                    icon: Icons.logout,
                    text: 'Logout',
                    onPressed: () {},
                  ),
                ]).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileDetails extends StatelessWidget {
  const ProfileDetails(
      {Key? key,
      required this.icon,
      required this.text,
      required this.onPressed})
      : super(key: key);
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: AppColors.mainColor,
      ),
      title: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: screenWidth(12),
          fontWeight: FontWeight.w500,
          color: AppColors.textColor1,
        ),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.keyboard_arrow_right_sharp,
        ),
        color: AppColors.mainColor,
      ),
    );
  }
}
