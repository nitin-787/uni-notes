import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:velocity_x/velocity_x.dart';

import '/config/size_config.dart';
import '/constants/colors.dart';
import '/widget/download.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List searchResult = [];

  void search(String query) async {
    final result = await FirebaseFirestore.instance
        .collection('notes')
        .where('text', isEqualTo: query)
        .get();

    setState(() {
      searchResult = result.docs.map((e) => e.data()).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    double listConatinerHeight;
    var height = MediaQuery.of(context).size.height;
    if (height < 600) {
      listConatinerHeight = screenHeight(112.34);
    } else {
      listConatinerHeight = screenHeight(82.34);
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor1,
        body: Column(
          children: [
            SizedBox(
              height: screenHeight(42),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: screenWidth(20),
                right: screenWidth(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: screenWidth(34.7),
                      child: TextField(
                        onChanged: (query) {
                          search(query);
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: screenWidth(15),
                            right: screenWidth(15),
                          ),
                          hintText: 'Search',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: screenWidth(11.19),
                            fontWeight: FontWeight.w500,
                            color: AppColors.textColor1,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: AppColors.textColor1,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: AppColors.textColor2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: AppColors.textColor2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: Navigator.of(context).pop,
                    child: Text(
                      "Cancel",
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth(13),
                        fontWeight: FontWeight.w500,
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight(20),
            ),
            Expanded(
              child: ListView.builder(
                controller: ScrollController(),
                shrinkWrap: true,
                itemCount: searchResult.length,
                itemBuilder: (context, index) {
                  final note = searchResult.elementAt(index);
                  return Column(
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        onPressed: () {
                          widget.onTap(note);
                        },
                        onLongPress: () {
                          widget.onTap(note);
                        },
                        child: Container(
                          height: listConatinerHeight,
                          margin: EdgeInsets.only(
                            bottom: screenWidth(13.2),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: screenWidth(85.6),
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fitWidth,
                                    image: AssetImage(
                                      "assets/images/avatar.png",
                                    ),
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: screenWidth(16),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: screenHeight(6),
                                    ),
                                    Text(
                                      searchResult[index]['text'],
                                      maxLines: 1,
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                        fontSize: screenWidth(12),
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.textColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenHeight(6),
                                    ),
                                    Text(
                                      "By: Nex-kun",
                                      style: GoogleFonts.poppins(
                                        fontSize: screenWidth(10),
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.textColor2,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          searchResult[index]['date_time'],
                                          style: GoogleFonts.poppins(
                                            fontSize: screenWidth(10),
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.textColor2,
                                          ),
                                        ),
                                        SizedBox(
                                          width: screenWidth(7),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  const DownloadingDialog(),
                                            );
                                          },
                                          tooltip: 'Download File',
                                          icon: Icon(
                                            Iconsax.document_download,
                                            color: AppColors.mainColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
