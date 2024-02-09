part of '../../zap_sizer.dart';

extension ZapResponsive on num {
  // الأبعاد
  double get h => this * DeviceData.height / 100;
  double get w => this * DeviceData.width / 100;
  double get sp =>
      this *
      (((h + w) + (DeviceData.pixelRatio * DeviceData.aspectRatio)) / 2) /
      100;
  double get dp => this * DeviceData.pixelRatio;

  double get cm => this / 2.54;
  double get mm => this / 25.4;
  double get Q => this / 101.6;
  double get pc => this / 6;
  double get pt => this / 72;
}
