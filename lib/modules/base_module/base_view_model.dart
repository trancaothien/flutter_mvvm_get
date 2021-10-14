import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseViewModel extends GetxController {
  final loadingSubject = BehaviorSubject<bool>.seeded(false);
  final errorSubject = BehaviorSubject<String>();

  void setLoading(bool loading) {
    if (loading != isLoading) loadingSubject.add(loading);
  }

  bool get isLoading => loadingSubject.value;

  void setError(String message) {
    errorSubject.add(message);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  @override
  void onClose() async {
    await loadingSubject.drain();
    loadingSubject.close();
    await errorSubject.drain();
    errorSubject.close();
    super.onClose();
  }
}
