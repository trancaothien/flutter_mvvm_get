import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef DataRequester<T> = Future<List<T>> Function(int offset);
typedef InitRequester<T> = Future<List<T>> Function();
typedef ItemBuilder<T> = Widget Function(
    List<T> data, BuildContext context, int index);

class WidgetLoadMoreVertical<T> extends StatefulWidget {
  const WidgetLoadMoreVertical.build(
      {Key? key,
      required this.itemBuilder,
      required this.dataRequester,
      required this.initRequester,
      this.styleError,
      this.loadingColor,
      this.widgetError})
      : super(key: key);

  final TextStyle? styleError;
  final ItemBuilder itemBuilder;
  final DataRequester dataRequester;
  final InitRequester initRequester;
  final Color? loadingColor;
  final Widget? widgetError;

  @override
  State createState() => WidgetLoadMoreVerticalState<T>();
}

class WidgetLoadMoreVerticalState<T> extends State<WidgetLoadMoreVertical> {
  bool isPerformingRequest = false;
  final ScrollController _controller = ScrollController();
  List<T>? _dataList;

  @override
  void initState() {
    super.initState();
    onRefresh();
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        _loadMore();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color loadingColor = widget.loadingColor ?? Theme.of(context).primaryColor;
    return _dataList == null
        ? loadingProgress(loadingColor)
        : (_dataList!.isNotEmpty
            ? RefreshIndicator(
                color: loadingColor,
                onRefresh: onRefresh,
                child: ListView.builder(
                  itemCount: _dataList!.length + 1,
                  itemBuilder: (context, index) {
                    if (index == _dataList!.length) {
                      return opacityLoadingProgress(
                          isPerformingRequest, loadingColor);
                    } else {
                      return widget.itemBuilder(_dataList!, context, index);
                    }
                  },
                  controller: _controller,
                  padding: const EdgeInsets.all(0),
                ),
              )
            : RefreshIndicator(
                color: loadingColor,
                onRefresh: onRefresh,
                child: Stack(
                  children: [
                    ListView(),
                    Center(
                      child: widget.widgetError ?? Text('no_data'.tr),
                    ),
                  ],
                ),
              ));
  }

  Future onRefresh() async {
    if (mounted) setState(() => _dataList = null);
    List initDataList = await widget.initRequester();
    if (mounted) setState(() => _dataList = initDataList as List<T>);
    return;
  }

  Future _loadMore() async {
    if (mounted) {
      setState(() => isPerformingRequest = true);
      int currentSize = 0;
      if (_dataList != null) currentSize = _dataList!.length;

      List<T> newDataList = await widget.dataRequester(currentSize) as List<T>;
      if (newDataList.isEmpty) {
        double edge = 50.0;
        double offsetFromBottom =
            _controller.position.maxScrollExtent - _controller.position.pixels;
        if (offsetFromBottom < edge) {
          _controller.animateTo(_controller.offset - (edge - offsetFromBottom),
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOut);
        }
      } else {
        _dataList!.addAll(newDataList);
      }
      if (mounted) setState(() => isPerformingRequest = false);
    }
  }

  Widget loadingProgress(loadingColor) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 2.0,
        valueColor: AlwaysStoppedAnimation<Color>(loadingColor),
      ),
    );
  }

  Widget opacityLoadingProgress(isPerformingRequest, loadingColor) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Opacity(
          opacity: isPerformingRequest ? 1.0 : 0.0,
          child: CircularProgressIndicator(
            strokeWidth: 2.0,
            valueColor: AlwaysStoppedAnimation<Color>(loadingColor),
          ),
        ),
      ),
    );
  }
}
