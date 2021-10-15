import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WidgetLoadingFullScreen extends StatelessWidget {
  final Widget child;
  final Stream<bool> loading;

  const WidgetLoadingFullScreen(
      {Key? key, required this.child, required this.loading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: loading,
      builder: (_, snapshot) {
        bool status = snapshot.data ?? false;
        return Stack(
          children: <Widget>[
            child,
            status ? _LoadingWidget() : const SizedBox(),
          ],
        );
      },
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12.withOpacity(0.5),
      constraints: const BoxConstraints.expand(),
      alignment: Alignment.center,
      child: const Center(
        child: SpinKitSquareCircle(
          color: Colors.blue,
          size: 55,
        ),
      ),
    );
  }
}
