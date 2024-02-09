part of '../../zap_sizer.dart';

class ZapSizer extends StatelessWidget {
  const ZapSizer({
    super.key,
    required this.builder,
  });

  final Widget Function(
    BuildContext context,
    BoxConstraints constraints,
  ) builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        DeviceData.initialize(context, constraints);
        return builder(context, constraints);
      },
    );
  }
}
