abstract class LanguageLocalDataSource {
  Future<void> updateLanguage(String language);
  Future<String> getPreferredLanguage();
}
