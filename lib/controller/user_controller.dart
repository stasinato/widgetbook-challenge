import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:widgetbook_challenge/models/user.dart';

/// [UserController] controller for [User] class.
class UserController {
  /// [UserController] constructor.
  UserController(this.context);

  /// [context] is the [UserController]'s property.
  BuildContext context;

  /// [saveName] save [User]'s name and updates UI.
  void saveName(String newName) {
    Provider.of<User>(context, listen: false).saveName(newName);
  }

  /// [updateName] update [User]'s name.
  // I don't want to call Provider in UI screen to change user's name
  // calling updateName is more intuitive
  // ignore: use_setters_to_change_properties
  void updateName(String name) {
    Provider.of<User>(context, listen: false).name = name;
  }
}
