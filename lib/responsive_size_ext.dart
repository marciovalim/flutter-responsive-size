import 'responsive_size.dart';

extension ScreenUtilExtension on num {
  num get w => ResponsiveSize().setWidth(this);

  num get h => ResponsiveSize().setHeight(this);

  num get sp => ResponsiveSize().setSp(this);
}
