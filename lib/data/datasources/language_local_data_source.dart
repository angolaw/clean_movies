import 'dart:async';
import 'package:hive/hive.dart';

abstract class LanguageLocalDataSource {
  Future<void> updateLanguage(String language);
  Future<String> getPreferredLanguage();
}

class LanguageLocalDataSourceImpl extends LanguageLocalDataSource {
  @override
  Future<String> getPreferredLanguage() async {
    final languageBox = Hive.box('languageBox');
    return languageBox.get('preferredLanguage');
  }

  @override
  Future<void> updateLanguage(String language) async {
    final languageBox = Hive.box('languageBox');
    unawaited(languageBox.put('preferredLanguage', language));
  }
}
