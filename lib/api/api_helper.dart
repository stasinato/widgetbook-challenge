import 'package:widgetbook_challenge/api/widgetbook_api.dart';

/// Calls welcomeToWidgetbook backend API.
///
/// Returns a "Hello [name]" with a probability of about .66
/// or throws an [UnexpectedException] otherwise.
Future<String>? widgetBookGreetings(String name) {
  final widgetBookApi = WidgetbookApi();
  return widgetBookApi.welcomeToWidgetbook(message: name);
}
