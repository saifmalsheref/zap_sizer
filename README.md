# Zap Sizer

Zap Sizer is a Flutter utility package that simplifies responsive design and sizing in Flutter applications. It provides widgets and extensions for building adaptive UIs that seamlessly adjust to different devices, screen sizes, and orientations.

[![فيديو الشرح](https://raw.githubusercontent.com/saifmalsheref/zap_sizer/main/assets/video_thumbnail.png)](https://raw.githubusercontent.com/saifmalsheref/zap_sizer/main/assets/Screencast%20from%202024-02-09%2022-03-57.mp4)


## Getting Started

To get started with Zap Sizer, simply add it to your Flutter project's dependencies:
```yaml
dependencies
  zap_sizer:
```


## DeviceData Class

The DeviceData class captures and manages information about the current device, including its type, screen type, orientation, and various dimensions.

initialize package:

```dart
ZapSizer(
  builder: (context, constraints) {
    // Access device-related data using DeviceData
    print("Device Type: ${DeviceData.deviceType}");
    print("Screen Type: ${DeviceData.screenType}");
    // ... (other device-related data)
    return MaterialApp();
  },
)

```

Access device-related data:

```dart
print("Device Type: ${DeviceData.deviceType}");
print("Screen Type: ${DeviceData.screenType}");
// ... (other device-related data)

```

`Parameters`:

deviceType: Current device type.
screenType: Current screen type.
orientation: Current device orientation.
width: Screen width.
height: Screen height.
pixelRatio: Device pixel ratio.
aspectRatio: Device aspect ratio.
dotsPerInch: Dots per inch.
textScaleFactor: Text scale factor.
isDarkMode: Indicates if the app is in dark mode.
isMobile: Indicates if the device is a mobile device.
isTablet: Indicates if the device is a tablet.
isDesktop: Indicates if the device is a desktop.

## Features

### 1. AdaptiveBuilder Widget

The `AdaptiveBuilder` widget allows you to build different parts of your UI based on the current device type, screen size, and orientation.

Usage example:

```dart
AdaptiveBuilder(
  builder: (context, device, orientation, screenType) {
    // Your UI components based on device and screen properties
    return Container(
      // Your widget tree
    );
  },
)
```


### 2. AdaptiveWidget Widget

The `AdaptiveWidget` widget adapts its content based on the current device type, allowing you to customize the UI for various platforms.

`Parameters`:

    desktop: Widget for desktop screens.
    tablet: Widget for tablet screens.
    mobile: Widget for mobile screens.
    android: Widget for Android devices.
    ios: Widget for iOS devices.
    macOs: Widget for macOS devices.
    linux: Widget for Linux devices.
    windows: Widget for Windows devices.
    web: Widget for web platforms.
    notSupportedWidget: Widget displayed for unsupported devices.

Usage example:

```dart
AdaptiveWidget(
  desktop: Text("Hello From Desktop"), // Optional Desktop-specific widget
  tablet: Text("Hello From Tablet"), // Optional tablet-specific widget
  mobile: Text("Hello From Mobile"), // Optional mobile-specific widget
  android: Text("Hello From Android"), // Optional Android-specific widget
  ios: Text("Hello From iOS"), // Optional iOS-specific widget
  macOs: Text("Hello From macOS"), // Optional macOS-specific widget
  linux: Text("Hello From Linux"), // Optional Linux-specific widget
  windows: Text("Hello From Windows"), // Optional Windows-specific widget
  web: Text("Hello From Web"), // Optional Web-specific widget
  notSupportedWidget: Text("Device Not Supported"), // Optional widget for unsupported devices
)

```

### 3. ZapResponsive Extension

The `ZapResponsive` extension provides methods for calculating dimensions based on the device's screen size and pixel density.

`Parameters`:

h: Percentage of the screen height.
w: Percentage of the screen width.
sp: Scaled pixels for responsive font size.
dp: Device-independent pixels.
cm: Centimeters.
mm: Millimeters.
Q: Quarter-millimeters.
pc: Picas.
pt: Points.

`Usage example`:

```dart
double heightInPercent = 50.0.h; // 50% of the screen height
double widthInPercent = 30.0.w;  // 30% of the screen width
double fontSizeInResponsiveSp = 16.0.sp;  // Responsive font size
double dpValue = 20.0.dp;  // Size in device-independent pixels
double cmValue = 5.0.cm;  // Size in centimeters

```

