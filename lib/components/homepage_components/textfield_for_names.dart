import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// TextField thought for writing names.
class TextFieldForNames extends StatefulWidget {
  /// Creates a new instance of [TextFieldForNames].
  const TextFieldForNames({Key? key, required this.onChangedPassed})
      : super(key: key);

  /// [onChangedPassed] is the function triggered on onChanged function
  /// in TextField.
  final Function(String newName) onChangedPassed;

  @override
  State<TextFieldForNames> createState() => _TextFieldForNamesState();
}

class _TextFieldForNamesState extends State<TextFieldForNames> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
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
      onChanged: (String newName) {
        widget.onChangedPassed(newName);
      },
    );
  }
}
