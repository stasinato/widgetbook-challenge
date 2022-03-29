import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:widgetbook_challenge/api/api_helper.dart';
import 'package:widgetbook_challenge/components/future_string_display_box.dart';

/// The homepage.
class Homepage extends StatefulWidget {
  /// Creates a new instance of [Homepage].
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late TextEditingController _controller;
  late String _name;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _name = _controller.text;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.interviewChallenge),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.name,
              textCapitalization: TextCapitalization.words,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp('^[a-zA-Z ]*'),
                ),
              ],
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.enterName,
              ),
            ),
            ElevatedButton(
              onPressed: updateName,
              child: Text(AppLocalizations.of(context)!.sendData),
            ),
            if (_name.isNotEmpty)
              FutureStringDisplayBox(
                futureString: widgetBookGreetings(_name),
              )
            else
              const SizedBox(),
          ],
        ),
      ),
    );
  }

  void updateName() {
    setState(() {
      _name = _controller.text.trim();
    });
  }
}
