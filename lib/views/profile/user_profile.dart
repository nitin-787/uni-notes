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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                image != null
                    ? CircleAvatar(
                        radius: 80,
                        backgroundImage: MemoryImage(image!),
                      )
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
            SizedBox(
              height: screenHeight(6),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: ListTile.divideTiles(
                  context: context,
                  tiles: [
                    OptionsList(
                      icon: Icons.account_circle,
                      text: 'IIH - Indian Institute of Himachal',
                      onPressed: () {
                        commingSoon(context);
                      },
                      icon2: Icons.help,
                    ),
                    SizedBox(
                      height: screenHeight(15),
                    ),
                    OptionsList(
                      icon: Icons.notes,
                      text: 'List View',
                      onPressed: () {
                        commingSoon(context);
                      },
                      icon2: Icons.arrow_forward_ios,
                    ),
                    SizedBox(
                      height: screenHeight(15),
                    ),
                    OptionsList(
                      icon: Icons.delete,
                      text: 'Deleted Notes',
                      onPressed: () {
                        commingSoon(context);
                      },
                      icon2: Icons.arrow_forward_ios,
                    ),
                    SizedBox(
                      height: screenHeight(15),
                    ),
                    OptionsList(
                      icon: Icons.dark_mode_outlined,
                      text: 'Dark mode',
                      onPressed: () {
                        commingSoon(context);
                      },
                      icon2: Icons.toggle_off_outlined,
                    ),
                    SizedBox(
                      height: screenHeight(15),
                    ),
                    OptionsList(
                      icon: Icons.info,
                      text: 'About us',
                      onPressed: () {
                        commingSoon(context);
                      },
                      icon2: Icons.arrow_forward_ios,
                    ),
                    SizedBox(
                      height: screenHeight(15),
                    ),
                    OptionsList(
                      icon: Icons.help,
                      text: 'Help',
                      onPressed: () {
                        commingSoon(context);
                      },
                      icon2: Icons.arrow_forward_ios,
                    ),
                    SizedBox(
                      height: screenHeight(15),
                    ),
                    OptionsList(
                      icon: Icons.logout,
                      text: 'Logout',
                      onPressed: () {},
                      icon2: Icons.arrow_forward_ios,
                    ),
                  ],
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OptionsList extends StatelessWidget {
  const OptionsList({
    Key? key,
    required this.icon,
    required this.icon2,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  final String text;
  final IconData icon;
  final IconData icon2;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: SizedBox(
        height: screenWidth(34.7),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: AppColors.textColor2,
              width: 1,
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
          ),
          onPressed: () {},
          child: Container(
            padding: EdgeInsets.only(
              left: screenWidth(13.2),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(icon),
                SizedBox(
                  width: screenWidth(10),
                ),
                Text(
                  text,
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth(10.5),
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColor1,
                  ),
                ),
                Icon(icon2)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
