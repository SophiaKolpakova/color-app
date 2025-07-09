/// A configuration class containing all numeric constants used
/// throughout the app.
// ignore: prefer_match_file_name
class AppConfig {
  /// The maximum value for RGB color channels (0-255 range).
  static const int maxRgbValue = 256;

  /// The full opacity value (100% opaque) for color rendering.
  static const double fullOpacity = 1.0;

  /// The interval (in taps) at which the emoji changes.
  static const int emojiChangeInterval = 20;

  /// The initial threshold for tap count to start the emoji cycle.
  static const int initialTapCountThreshold = 0;

  /// The duration of the color animation in milliseconds.
  static const int animationDurationMs = 500;

  /// The stroke width for text outline effect.
  static const double strokeWidth = 3.0;

  /// The font size for the "HELLO THERE" text.
  static const double fontSizeHello = 45.0;

  /// The font size for the tap count text.
  static const double fontSizeTapCount = 35.0;

  /// The vertical spacing height between text elements.
  static const double spacingHeight = 14.0;
}
