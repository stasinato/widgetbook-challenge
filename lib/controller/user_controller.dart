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

  /// get [User]'s [name].
  String get name => Provider.of<User>(context, listen: false).name;

  /// set [User]'s [name].
  set name(String name) {
    Provider.of<User>(context, listen: false).name = name;
  }
}
