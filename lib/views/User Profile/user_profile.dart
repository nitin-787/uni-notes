import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mynotes/constants/colors.dart';
import 'package:mynotes/views/User%20Profile/about_page.dart';
import 'package:mynotes/views/User%20Profile/draft_notes.dart';
import 'package:mynotes/views/User%20Profile/help_page.dart';
import 'package:mynotes/views/User%20Profile/personal_details.dart';
import 'package:mynotes/views/User%20Profile/saved_notes.dart';
import 'package:mynotes/views/User%20Profile/trashed.dart';

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
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
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
                      radius: 64, backgroundImage: MemoryImage(image!))
                  : CircleAvatar(
                      radius: 64,
                      backgroundColor: AppColors.mainColor,
                    ),
              Positioned(
                  bottom: -8,
                  left: 80,
                  child: IconButton(
                    onPressed: () {
                      selectImage();
                    },
                    icon: const Icon(Icons.add_a_photo),
                  ))
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Rohan Khanna',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: ListTile.divideTiles(context: context, tiles: [
                ProfileDetails(
                  icon: Icons.account_circle,
                  text: 'Personal Details',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PersonalDetails()));
                  },
                ),
                ProfileDetails(
                  icon: Icons.save_rounded,
                  text: 'Saved Notes',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SavedNotes()));
                  },
                ),
                ProfileDetails(
                  icon: Icons.notes,
                  text: 'Draft Notes',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DraftNotes()));
                  },
                ),
                ProfileDetails(
                  icon: Icons.delete,
                  text: 'Trashed',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TrashedNotes()));
                  },
                ),
                ProfileDetails(
                  icon: Icons.info,
                  text: 'About',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AboutPage()));
                  },
                ),
                ProfileDetails(
                  icon: Icons.help,
                  text: 'Help',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HelpPage()));
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
      )),
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
        style: const TextStyle(fontSize: 16),
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
