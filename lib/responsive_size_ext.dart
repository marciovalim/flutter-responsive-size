import 'responsive_size.dart';

extension ScreenUtilExtension on num {
  double get w => ResponsiveSize().setWidth(this as double);

  double get h => ResponsiveSize().setHeight(this as double);

  double get sp => ResponsiveSize().setSp(this as double);
}

double getWidth(double n) => ResponsiveSize().setWidth(n);

double getHeight(double n) => ResponsiveSize().setHeight(n);

double getSp(double n) => ResponsiveSize().setSp(n);

double get widthBlock => ResponsiveSize.widthBlock;

double get heightBlock => ResponsiveSize.heightBlock;

double get spBlock => ResponsiveSize.spBlock;
