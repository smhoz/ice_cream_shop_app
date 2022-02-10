import 'package:flutter/material.dart';

mixin MessageNotifierMixin on ChangeNotifier {
  String? _error;
  String? get error => _error;

  String? _info;
  String? get info => _info;

  void notifyError(dynamic error) {
    _error = error.toString();
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }

  void notifyInfo(String info) {
    _info = info;
    notifyListeners();
  }

  void clearInfo() {
    _info = null;
  }
}
