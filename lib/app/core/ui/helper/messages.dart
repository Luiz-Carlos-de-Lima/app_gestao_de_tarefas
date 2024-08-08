import 'package:app_gestao_de_tarefas/app/core/ui/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:notify_inapp/notify_inapp.dart';

enum NotifyType {
  info,
  success,
  warning,
  error,
}

enum NotifyPosition {
  top,
  center,
  bottom,
}

class Messages {
  final BuildContext context;
  final Notify _notify = Notify();

  Messages._(this.context) {
    _listerPop();
  }

  factory Messages.of(BuildContext context) {
    return Messages._(context);
  }

  void showError(String message) {
    _showMessage(message, NotifyType.error);
  }

  void showInfo(String message) {
    _showMessage(message, NotifyType.info);
  }

  void showSuccess(String message) {
    _showMessage(message, NotifyType.success);
  }

  void _showMessage(String message, NotifyType notifyType) {
    _notify.show(
      context,
      _MessagesWidget(
        message: message,
        type: notifyType,
        closeCallback: () {
          _notify.dismiss(true);
        },
      ),
      keepDuration: 5000,
      topOffset: _getPosition(context: context, position: NotifyPosition.top),
    );
  }

  void dismiss() {
    _notify.dismiss(true);
  }

  double _getPosition({required BuildContext context, required NotifyPosition position}) {
    final mediaQuery = MediaQuery.of(context);
    return (mediaQuery.systemGestureInsets.top + mediaQuery.padding.top) - 20;
  }

  void _listerPop() {
    Modular.to.addListener(() {
      _notify.dismiss(true);
    });
  }
}

class _MessagesWidget extends StatelessWidget {
  final String message;
  final NotifyType type;
  final void Function()? closeCallback;

  const _MessagesWidget({required this.message, required this.type, this.closeCallback});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double width = constraints.maxWidth;

      if (width > 500) {
        width = 500;
      }

      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(10.0),
            constraints: BoxConstraints(maxWidth: width),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  blurRadius: 2,
                  spreadRadius: -1,
                  color: Theme.of(context).colorScheme.shadow.withAlpha(50),
                )
              ],
            ),
            child: Container(
              constraints: BoxConstraints(maxWidth: width - 20),
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
              decoration: BoxDecoration(
                color: _getColor(context: context, type: type).withAlpha(30),
                borderRadius: BorderRadius.circular(15.0),
                border: Border(
                  left: BorderSide(color: _getColor(context: context, type: type), width: 10),
                  top: BorderSide(color: _getColor(context: context, type: type), width: 2),
                  right: BorderSide(color: _getColor(context: context, type: type), width: 2),
                  bottom: BorderSide(color: _getColor(context: context, type: type), width: 2),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      message,
                      style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onBackground.withAlpha(150)),
                    ),
                  ),
                  if (closeCallback != null)
                    IconButton(
                      onPressed: closeCallback,
                      icon: Icon(
                        Icons.close,
                        color: Theme.of(context).colorScheme.onBackground.withAlpha(150),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }

  Color _getColor({required BuildContext context, required NotifyType type}) {
    final colorScheme = Theme.of(context).colorScheme;
    final success = colorScheme.brightness == Brightness.light ? Colors.green.shade700 : Colors.green.shade300;
    final warning = colorScheme.brightness == Brightness.light ? Colors.yellow.shade700 : Colors.yellow.shade300;

    return switch (type) {
      NotifyType.info => colorScheme.primary,
      NotifyType.success => success,
      NotifyType.warning => warning,
      NotifyType.error => context.errorColor,
    };
  }
}
