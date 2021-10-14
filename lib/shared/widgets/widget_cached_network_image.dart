import 'package:flutter/material.dart';

class WidgetCachedNetworkImage extends StatelessWidget {
  final String url;
  final Widget? errorWidget;
  final Widget? holderWidget;

  const WidgetCachedNetworkImage({
    Key? key,
    required this.url,
    this.errorWidget,
    this.holderWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
