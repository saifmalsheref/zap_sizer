part of '../../zap_sizer.dart';

class AdaptiveBuilder extends StatelessWidget {
  const AdaptiveBuilder({super.key, required this.builder});
  final Widget Function(
    BuildContext contxt,
    DeviceType device,
    DeviceOrientation orientation,
    ScreenType state,
  ) builder;
  @override
  Widget build(BuildContext context) {
    return builder(
      context,
      DeviceData.deviceType,
      DeviceData.orientation,
      DeviceData.screenType,
    );
  }
}

class AdaptiveWidget extends StatelessWidget {
  const AdaptiveWidget({
    Key? key,
    this.desktop = const Text("Hello From Desktop"),
    this.tablet = const Text("Hello From Tablet"),
    this.mobile = const Text("Hello From Mobile"),
    this.android,
    this.ios,
    this.macOs,
    this.linux,
    this.windows,
    this.web,
    this.hideScreens,
    this.hideDevices,
    this.notSupportedWidget,
  }) : super(key: key);

  final List<ScreenType>? hideScreens;
  final List<DeviceType>? hideDevices;
  final Widget desktop;
  final Widget tablet;
  final Widget mobile;
  final Widget? android;
  final Widget? ios;
  final Widget? macOs;
  final Widget? linux;
  final Widget? windows;
  final Widget? web;
  final Widget? notSupportedWidget;

  @override
  Widget build(BuildContext context) {
    ScreenType currentScreen = DeviceData.screenType;
    DeviceType currentDevice = DeviceData.deviceType;

    if ((hideScreens != null && hideScreens!.contains(currentScreen)) ||
        (hideDevices != null && hideDevices!.contains(currentDevice))) {
      if (notSupportedWidget != null) {
        return notSupportedWidget!;
      }
      return const Text("Device Not Support");
    }

    // تحديد الواجهة المناسبة بناءً على الشروط
    Widget selectedWidget;
    if (currentScreen == ScreenType.desktop) {
      selectedWidget = desktop;
    } else if (currentScreen == ScreenType.tablet) {
      selectedWidget = tablet;
    } else {
      selectedWidget = mobile;
    }

    // إعادة استخدام الدالة _getPlatformWidget
    return _getPlatformWidget(
      android: android,
      ios: ios,
      macOs: macOs,
      linux: linux,
      windows: windows,
      web: web,
      defaultWidget: selectedWidget,
    );
  }

  Widget _getPlatformWidget({
    Widget? android,
    Widget? ios,
    Widget? macOs,
    Widget? linux,
    Widget? windows,
    Widget? web,
    required Widget defaultWidget,
  }) {
    switch (DeviceData.deviceType) {
      case DeviceType.Android:
        return android ?? defaultWidget;
      case DeviceType.Ios:
        return ios ?? defaultWidget;
      case DeviceType.macOS:
        return macOs ?? defaultWidget;
      case DeviceType.Linux:
        return linux ?? defaultWidget;
      case DeviceType.Windows:
        return windows ?? defaultWidget;
      case DeviceType.Web:
        return web ?? defaultWidget;
      default:
        return defaultWidget;
    }
  }
}
