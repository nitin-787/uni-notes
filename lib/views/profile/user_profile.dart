import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

import '/config/size_config.dart';
import '/constants/colors.dart';
import '/constants/routes.dart';
import '/utilities/dialogs/comming_soon.dart';
import '/views/profile/option_list.dart';
import '/utilities/edit_image.dart';

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
                      icon: Iconsax.user,
                      text: 'Profile',
                      onPressed: () {
                        Navigator.pushNamed(context, profileDetailRoute);
                      },
                      icon2: Icons.arrow_forward_ios,
                    ),
                    SizedBox(
                      height: screenHeight(18),
                    ),
                    OptionsList(
                      // icon: Iconsax.element_equal,
                      icon: Iconsax.row_vertical,
                      text: 'List view',
                      onPressed: () {
                        commingSoon(context);
                      },
                      icon2: FontAwesomeIcons.ellipsisVertical,
                      iconSize2: 25,
                    ),
                    SizedBox(
                      height: screenHeight(18),
                    ),
                    OptionsList(
                      // icon: Iconsax.moon,
                      icon: Iconsax.sun_1,
                      text: 'Dark mode',
                      onPressed: () {
                        commingSoon(context);
                      },
                      icon2: FontAwesomeIcons.toggleOff,
                      iconSize2: 25,
                    ),
                    SizedBox(
                      height: screenHeight(18),
                    ),
                    OptionsList(
                      icon: Iconsax.info_circle,
                      text: 'About us',
                      onPressed: () {
                        commingSoon(context);
                      },
                      icon2: Icons.arrow_forward_ios,
                    ),
                    SizedBox(
                      height: screenHeight(18),
                    ),
                    OptionsList(
                      icon: Iconsax.message_question4,
                      text: 'Help',
                      onPressed: () {
                        commingSoon(context);
                      },
                      icon2: Icons.arrow_forward_ios,
                    ),
                    SizedBox(
                      height: screenHeight(18),
                    ),
                    OptionsList(
                      icon: Iconsax.logout,
                      text: 'Logout',
                      onPressed: () {
                        commingSoon(context);
                      },
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
