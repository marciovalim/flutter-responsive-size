import 'responsive_size.dart';

extension ScreenUtilExtension on num {
  num get w => ResponsiveSize().setWidth(this);

  num get h => ResponsiveSize().setHeight(this);

  num get sp => ResponsiveSize().setSp(this);
}

num getWidth(num n) => ResponsiveSize().setWidth(n);

num getHeight(num n) => ResponsiveSize().setHeight(n);

num getSp(num n) => ResponsiveSize().setSp(n);

num get widthBlock => ResponsiveSize.widthBlock;

num get heightBlock => ResponsiveSize.heightBlock;

num get spBlock => ResponsiveSize.spBlock;
