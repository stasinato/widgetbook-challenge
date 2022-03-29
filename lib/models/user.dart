import 'package:flutter/cupertino.dart';

/// User class.
class User extends ChangeNotifier {
  /// [User] constructor.
  User(this.name);

  /// [name] is the [User]'s property.
  String name;

  /// [saveName] updates [User]'s name and triggers [notifyListeners].
  void saveName(String newName) {
    name = newName;
    notifyListeners();
  }
}
