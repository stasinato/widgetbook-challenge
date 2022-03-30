import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:widgetbook_challenge/models/user.dart';

/// [UserController] controller for [User] class.
class UserController {
  /// [saveName] save [User]'s name and updates UI.
  void saveName(BuildContext context, String newName) {
    Provider.of<User>(context, listen: false).saveName(newName);
  }

  /// [updateName] update [User]'s name.
  void updateName(BuildContext context, String name) {
    Provider.of<User>(context, listen: false).name = name;
  }
}
