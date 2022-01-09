// ignore_for_file: avoid_print

class Logger {
  List<String> messages;

  Logger(this.messages) {
    for (final message in messages) {
      print(message);
    }
  }
}
