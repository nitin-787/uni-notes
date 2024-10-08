import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '/views/chat/chat_room.dart';
import '/views/home/search_view.dart';
import '/views/notes/create_update_note_view.dart';
import '/views/profile/user_details.dart';
import '/views/profile/user_profile.dart';

const createOrUpdateNoteRoute = '/notes/new-note';
const searchRoute = '/constants/search-view';
const chatRoom = '/constants/chat-room';
const profileView = '/profile/profile';
const profileDetailRoute = '/profile/detail';

PageTransition? onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case createOrUpdateNoteRoute:
      return PageTransition(
        child: const CreateUpdateNoteView(),
        type: PageTransitionType.bottomToTop,
        settings: settings,
      );
    case searchRoute:
      return PageTransition(
        child: const SearchView(),
        type: PageTransitionType.fade,
        settings: settings,
      );
    case chatRoom:
      return PageTransition(
        child: const ChatRoom(),
        type: PageTransitionType.fade,
        settings: settings,
      );
    case profileView:
      return PageTransition(
        child: const UserProfile(),
        type: PageTransitionType.rightToLeftWithFade,
        settings: settings,
      );
    case profileDetailRoute:
      return PageTransition(
        child: const UserDetails(),
        type: PageTransitionType.rightToLeftWithFade,
        settings: settings,
      );
    default:
      return null;
  }
}
