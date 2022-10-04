import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynotes/config/size_config.dart';
import 'package:mynotes/constants/colors.dart';

class ChatView extends StatelessWidget {
  const ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            'ChatView',
            style: GoogleFonts.poppins(
              fontSize: screenWidth(40),
              fontWeight: FontWeight.w500,
              color: AppColors.textColor1,
            ),
          ),
        ],
      ),
    );
  }
}
