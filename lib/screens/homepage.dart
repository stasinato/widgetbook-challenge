import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:widgetbook_challenge/api/api_helper.dart';
import 'package:widgetbook_challenge/components/homepage_components/components.dart';
import 'package:widgetbook_challenge/controller/user_controller.dart';
import 'package:widgetbook_challenge/models/user.dart';

/// The homepage.
class Homepage extends StatelessWidget {
  /// Creates a new instance of [Homepage].
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _userController = UserController();

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.interviewChallenge),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFieldForNames(onChangedPassed: _userController.updateName),
            ElevatedButton(
              onPressed: () => _userController.saveName(
                context,
                Provider.of<User>(context, listen: false).name,
              ),
              child: Text(AppLocalizations.of(context)!.sendData),
            ),
            Consumer<User>(
              builder: (context, user, child) {
                if (Provider.of<User>(context, listen: false).name.isNotEmpty) {
                  return FutureStringDisplayBox(
                    futureString: widgetbookGreetings(user.name),
                  );
                }
                return const SizedBox();
              },
            )
          ],
        ),
      ),
    );
  }
}
