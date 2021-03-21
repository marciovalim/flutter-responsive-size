# Responsive Size

A package that helps create responsive UI in Flutter.

## How to use

Init ResponsiveSize in main.dart like so:

<pre>
ResponsiveSize.init(designWidth: 414, designHeight: 896);
</pre>

Import responsive_size to use it's extensions

<pre>
import 'package:responsive_size/responsive_size.dart';
</pre>

Then just call .w (width), .h (height), .sp (font-size):

<pre>
 return Container(
    width: 120.w, // 120 is the original design width
    height: 240.h, // 240 is the original design height
    child: Text(
      'Hello world', 
      style: TextStyle(fontSize: 12.sp), // 12 is the original design fontSize
    ), 
 );
</pre>

Or call getWidth (width), getHeight (height), getSp (font-size):

<pre>
 return Container(
    width: getWidth(120), // 120 is the original design width
    height: getHeight(240), // 240 is the original design height
    child: Text(
      'Hello world', 
      style: TextStyle(fontSize: getSp(12)), // 12 is the original design fontSize
    ), 
 );
</pre>

Or even just use blocks: widthBlock (width), heightBlock (height), spBlock (font-size)

<pre>
 return Container(
    width: widthBlock * 15, // widthBlock represent 1% of screenWidth
    height: heightBlock * 30, // heightBlock represent 1% of screenHeight
    child: Text(
      'Hello world', 
      style: TextStyle(fontSize: spBlock * 1.1), // spBlock represent 100% of defaultFontSize
    ), 
 );
</pre>

## How to install

Add responsive_size under your pubspec dependencies.

## License

This project is under MIT License.
