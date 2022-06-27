import 'package:get/route_manager.dart';
import 'package:drixion/language/ar.dart';
import 'package:drixion/language/en.dart';
import 'package:drixion/language/fr.dart';
import 'package:drixion/utils/my_string.dart';

class LocaliztionApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ene: en,
        ara: ar,
        frf: fr,
      };
}
