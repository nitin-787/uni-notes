import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class SavedNotes extends StatelessWidget {
  const SavedNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Saved Notes',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.mainColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.save_rounded,
              color: AppColors.mainColor,
            ),
            title: const Text(
              'Notes1',
              style: TextStyle(color: Colors.black),
            ),
            subtitle: const Text(
              'Hello, I am a flutter developer',
              style: TextStyle(color: Colors.grey),
            ),
            trailing: Icon(
              Icons.delete,
              color: AppColors.mainColor,
            ),
          )
        ],
      )),
    );
  }
}
