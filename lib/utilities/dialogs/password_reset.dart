import 'package:flutter/material.dart';
import 'package:mynotes/utilities/dialogs/generic_dialog.dart';

Future<void> showPasswordResetSentDialog(BuildContext context) {
  return showGenericDialog(
    context: context,
    title: 'Password',
    content:
        'We have now sent you a password reset Link. Please check your email for more information.',
    optionBuilder: () => {
      'OK': null,
    },
  );
}
