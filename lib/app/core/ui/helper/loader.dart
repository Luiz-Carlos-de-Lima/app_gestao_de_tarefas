import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

enum LoaderStatus {
  initial,
  loading,
  dispose,
}

mixin Loader<T extends StatefulWidget> on State<T> {
  bool isOpen = false;

  void showLoader() {
    if (!isOpen && mounted) {
      isOpen = true;

      showDialog(
        barrierDismissible: false,
        useSafeArea: false,
        context: context,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );
    }
  }

  void hideLoader() {
    if (isOpen && mounted) {
      isOpen = false;
      Modular.to.pop();
    }
  }

  @override
  void dispose() {
    hideLoader();
    super.dispose();
  }
}
