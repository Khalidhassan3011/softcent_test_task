import '../constants.dart';
import 'storage.dart';

class StorageHelper {
  static const String language = "language";

  static String get getLanguage => Storage.getValue<String>(language) ?? Constants.language.english;
  static set setLanguage(String lan) => Storage.saveValue(language, lan);
}
