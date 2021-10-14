import 'package:flutter/material.dart';

class WidgetCachedNetworkImage extends StatelessWidget {
  final String url;
  final Widget? errorWidget;
  final Widget? holderWidget;
  final BoxShape? shape;
  const WidgetCachedNetworkImage({
    Key? key,
    required this.url,
    this.errorWidget,
    this.holderWidget,
    this.shape = BoxShape.circle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
