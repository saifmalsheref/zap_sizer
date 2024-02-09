// device_data.dart
// ignore_for_file: constant_identifier_names

part of '../../zap_sizer.dart';

enum DeviceType {
  Android,
  Ios,
  Web,
  macOS,
  Windows,
  Linux,
  ChromeOS,
  fuchsia,
  Unknown
}

enum ScreenType { mobile, tablet, desktop }

enum DeviceOrientation { portrait, landscape }

class DeviceData {
  static late DeviceType deviceType;
  static late ScreenType screenType;
  static late DeviceOrientation orientation;
  static late BuildContext buildContext;
  static late double width;
  static late double height;
  static late double pixelRatio;
  static late double aspectRatio;
  static double get dotsPerInch =>
      MediaQuery.of(buildContext).devicePixelRatio * 160.0;
  static double get textScaleFactor =>
      MediaQuery.of(buildContext).textScaleFactor;

  static bool get isDarkMode =>
      Theme.of(buildContext).brightness == Brightness.dark;

  static bool get isMobile => screenType == ScreenType.mobile;

  static bool get isTablet => screenType == ScreenType.tablet;

  static bool get isDesktop => screenType == ScreenType.desktop;

  static void initialize(BuildContext context, BoxConstraints constraints) {
    width = constraints.maxWidth;
    height = constraints.maxHeight;
    buildContext = context;
    pixelRatio = MediaQuery.of(context).devicePixelRatio;
    aspectRatio = MediaQuery.of(context).size.aspectRatio;

    deviceType = _getDeviceType();
    screenType = getScreenType(width);

    MediaQuery.of(context).orientation == Orientation.landscape
        ? orientation = DeviceOrientation.landscape
        : orientation = DeviceOrientation.portrait;
    if (orientation == DeviceOrientation.landscape) {
      width = MediaQuery.of(context).size.height;
    }
  }

  static DeviceType _getDeviceType() {
    switch (Theme.of(buildContext).platform) {
      case TargetPlatform.android:
        return DeviceType.Android;
      case TargetPlatform.iOS:
        return DeviceType.Ios;
      case TargetPlatform.macOS:
        return DeviceType.macOS;
      case TargetPlatform.windows:
        return DeviceType.Windows;
      case TargetPlatform.linux:
        return DeviceType.Linux;
      case TargetPlatform.fuchsia:
        return DeviceType.fuchsia;
      default:
        return DeviceType.Web;
    }
  }

  static ScreenType getScreenType(double screenWidth) {
    if (screenWidth < 600) {
      return ScreenType.mobile;
    } else if (screenWidth >= 600 && screenWidth < 1200) {
      return ScreenType.tablet;
    } else {
      return ScreenType.desktop;
    }
  }
}
