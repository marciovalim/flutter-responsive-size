library responsive_size;

import 'dart:ui';

export 'responsive_size_ext.dart';

class ResponsiveSize {
  static ResponsiveSize? _instance;
  static const int defaultWidth = 1080;
  static const int defaultHeight = 1920;

  late num desingWidthPx;
  late num designHeightPx;
  late bool allowFontScaling;

  static double? _screenWidth;
  static double? _screenHeight;
  static double? _pixelRatio;
  static double? _statusBarHeight;
  static double? _bottomBarHeight;
  static double? _textScaleFactor;

  ResponsiveSize._();

  factory ResponsiveSize() {
    assert(_instance != null, 'Don\'t forget to init ResponsiveSize');
    return _instance!;
  }

  static void init({
    num designWidth = defaultWidth,
    num designHeight = defaultHeight,
    bool allowFontScaling = false,
  }) {
    if (_instance == null) {
      _instance = ResponsiveSize._();
    }
    _instance!.desingWidthPx = designWidth;
    _instance!.designHeightPx = designHeight;
    _instance!.allowFontScaling = allowFontScaling;
    _pixelRatio = window.devicePixelRatio;
    _screenWidth = window.physicalSize.width;
    _screenHeight = window.physicalSize.height;
    _statusBarHeight = window.padding.top;
    _bottomBarHeight = window.padding.bottom;
    _textScaleFactor = window.textScaleFactor;
  }

  static double? get textScaleFactor => _textScaleFactor;

  static double? get pixelRatio => _pixelRatio;

  static double get screenWidth => _screenWidth! / _pixelRatio!;

  static double get screenHeight => _screenHeight! / _pixelRatio!;

  static double? get screenWidthPx => _screenWidth;

  static double? get screenHeightPx => _screenHeight;

  static double get statusBarHeight => _statusBarHeight! / _pixelRatio!;

  static double? get statusBarHeightPx => _statusBarHeight;

  static double? get bottomBarHeight => _bottomBarHeight;

  double get scaleWidth => screenWidth / desingWidthPx;

  double get scaleHeight =>
      (_screenHeight! - _statusBarHeight! - _bottomBarHeight!) / designHeightPx;

  double get scaleText => scaleWidth;

  /// Width function
  /// Adapted to the device width of the UI Design.
  /// Height can also be adapted according to this to ensure no deformation ,
  /// if you want a square
  num setWidth(num width) => width * scaleWidth;

  /// Height function
  /// Highly adaptable to the device according to UI Design
  /// It is recommended to use this method to achieve a high degree of adaptation
  /// when it is found that one screen in the UI design
  /// does not match the current style effect, or if there is a difference in shape.
  num setHeight(num height) => height * scaleHeight;

  ///FontSize function
  ///@param [fontSize] UI in px.
  ///Font size adaptation method
  ///@param [fontSize] The size of the font on the UI design, in px.
  ///@param [allowFontScaling]
  num setSp(num fontSize, {bool? allowFontScalingSelf}) =>
      allowFontScalingSelf == null
          ? (allowFontScaling
              ? (fontSize * scaleText)
              : ((fontSize * scaleText) / _textScaleFactor!))
          : (allowFontScalingSelf
              ? (fontSize * scaleText)
              : ((fontSize * scaleText) / _textScaleFactor!));
}
