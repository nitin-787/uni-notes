import 'package:flutter/material.dart';

import '/constants/colors.dart';

class NotesGridView extends StatefulWidget {
  const NotesGridView({super.key});

  @override
  State<NotesGridView> createState() => _NotesGridViewState();
}

class _NotesGridViewState extends State<NotesGridView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor1,
        appBar: AppBar(
          title: const Text('Notes'),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Stack(
            children: [
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 30.0,
                  mainAxisSpacing: 30.0,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Stack(children: [
                      Image.asset(
                        // add alignment
                        "assets/images/avatar.png",
                        fit: BoxFit.cover,
                        height: 100,
                        width: double.infinity,
                        alignment: Alignment.center,
                      ),
                      const Positioned(
                        left: 20,
                        bottom: 0,
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                "Note Title",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Note Title",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
