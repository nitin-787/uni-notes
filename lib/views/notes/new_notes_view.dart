import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewNotesView extends StatelessWidget {
  const NewNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.only(top: 10),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 60.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Hi, Nex",
                        style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.blueAccent,
                        ),
                      ),
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage("assets/images/avatar.png"),
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Public Wall",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.blueAccent,
                          ),
                        ),
                        Text(
                          "Private chat",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 500,
                    height: 50,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 202, 209, 214),
                        side: const BorderSide(
                          color: Color.fromARGB(130, 130, 130, 130),
                          width: 1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      // need to add google sign in
                      onPressed: () {},
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.search,
                              color: Color.fromARGB(255, 137, 137, 137),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Search notes",
                              style: GoogleFonts.poppins(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromARGB(255, 137, 137, 137),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
