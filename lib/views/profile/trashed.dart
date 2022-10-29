import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TrashedNotes extends StatelessWidget {
  const TrashedNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Trashed Notes',
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
        actions: [
          Row(
            children: [
              Icon(
                Icons.delete,
                color: AppColors.mainColor,
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                'All',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                width: 5,
              ),
              Icon(
                Icons.restore,
                color: AppColors.mainColor,
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                'All',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                width: 10,
              )
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.delete,
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
              Icons.delete_forever_rounded,
              color: AppColors.mainColor,
            ),
          )
        ],
      )),
    );
  }
}
