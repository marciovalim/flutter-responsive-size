library responsive_size;

import 'dart:ui';

export 'responsive_size_ext.dart';

class ResponsiveSize {
  static ResponsiveSize? _instance;
  static const defaultWidth = 1080.0;
  static const defaultHeight = 1920.0;

  late double desingWidthPx;
  late double designHeightPx;
  late bool allowFontScaling;
  late double defaultFontSize;

  static late double _screenWidth;
  static late double _screenHeight;
  static late double _widthBlock;
  static late double _heightBlock;
  static late double _spBlock;
  static late double _pixelRatio;
  static late double _statusBarHeight;
  static late double _bottomBarHeight;
  static late double _textScaleFactor;

  ResponsiveSize._();

  factory ResponsiveSize() {
    assert(_instance != null, 'Don\'t forget to init ResponsiveSize');
    return _instance!;
  }

  static void init({
    double designWidth = defaultWidth,
    double designHeight = defaultHeight,
    bool allowFontScaling = false,
    double defaultFontSize = 16,
  }) {
    if (_instance == null) {
      _instance = ResponsiveSize._();
    }
    _instance!.desingWidthPx = designWidth;
    _instance!.designHeightPx = designHeight;
    _instance!.allowFontScaling = allowFontScaling;
    _instance!.defaultFontSize = defaultFontSize;
    _pixelRatio = window.devicePixelRatio;
    _screenWidth = window.physicalSize.width;
    _screenHeight = window.physicalSize.height;
    _widthBlock = screenWidth / 100;
    _heightBlock = screenHeight / 100;
    _statusBarHeight = window.padding.top;
    _bottomBarHeight = window.padding.bottom;
    _textScaleFactor = window.textScaleFactor;
    _spBlock = _instance!.setSp(_instance!.defaultFontSize) as double;
  }

  static double? get textScaleFactor => _textScaleFactor;

  static double? get pixelRatio => _pixelRatio;

  static double get screenWidth => _screenWidth / _pixelRatio;

  static double get screenHeight => _screenHeight / _pixelRatio;

  static double get widthBlock => _widthBlock;

  static double get heightBlock => _heightBlock;

  static double get spBlock => _spBlock;

  static double? get screenWidthPx => _screenWidth;

  static double? get screenHeightPx => _screenHeight;

  static double get statusBarHeight => _statusBarHeight / _pixelRatio;

  static double? get statusBarHeightPx => _statusBarHeight;

  static double? get bottomBarHeight => _bottomBarHeight;

  double get scaleWidth => screenWidth / desingWidthPx;

  double get scaleHeight =>
      (_screenHeight - _statusBarHeight - _bottomBarHeight) / designHeightPx;

  double get scaleText => scaleWidth;

  /// Width function
  /// Adapted to the device width of the UI Design.
  /// Height can also be adapted according to this to ensure no deformation ,
  /// if you want a square
  double setWidth(double width) => width * scaleWidth;

  /// Height function
  /// Highly adaptable to the device according to UI Design
  /// It is recommended to use this method to achieve a high degree of adaptation
  /// when it is found that one screen in the UI design
  /// does not match the current style effect, or if there is a difference in shape.
  double setHeight(double height) => height * scaleHeight;

  ///FontSize function
  ///@param [fontSize] UI in px.
  ///Font size adaptation method
  ///@param [fontSize] The size of the font on the UI design, in px.
  ///@param [allowFontScaling]
  double setSp(double fontSize, {bool? allowFontScalingSelf}) =>
      allowFontScalingSelf == null
          ? (allowFontScaling
              ? (fontSize * scaleText)
              : ((fontSize * scaleText) / _textScaleFactor))
          : (allowFontScalingSelf
              ? (fontSize * scaleText)
              : ((fontSize * scaleText) / _textScaleFactor));
}
