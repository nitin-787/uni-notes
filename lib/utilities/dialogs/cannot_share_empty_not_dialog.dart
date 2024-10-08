import 'package:flutter/material.dart';

import '/extentions/buildcontext/loc.dart';
import '/utilities/dialogs/generic_dialog.dart';

Future<void> showCannotShareEmptyNoteDialog(BuildContext context) {
  return showGenericDialog<void>(
    context: context,
    title: context.loc.sharing,
    content: context.loc.cannot_share_empty_note_prompt,
    optionBuilder: () => {
      context.loc.ok: null,
    },
  );
}
