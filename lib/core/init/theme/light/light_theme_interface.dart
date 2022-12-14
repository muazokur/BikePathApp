import 'package:bike_path_app/core/init/theme/light/color_scheme_light.dart';
import 'package:bike_path_app/core/init/theme/light/text_theme_light.dart';

abstract class ILightTheme {
  ColorSchemeLight colorSchemeLight = ColorSchemeLight.instance!;
  TextThemeLight textThemeLight = TextThemeLight.instance!;
}
