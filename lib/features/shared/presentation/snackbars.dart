import 'package:flutter/material.dart';

void showSuccessSnackBar(
  BuildContext context, {
  String? title,
  Duration? duration,
  required String message,
  SnackBarAction? snackBarAction,
  bool clearCurrentSnackBar = false,
}) {
  final scaffoldMessenger = ScaffoldMessenger.of(context);
  if (clearCurrentSnackBar) {
    scaffoldMessenger.clearSnackBars();
  }
  scaffoldMessenger.showSnackBar(
    SnackBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
      elevation: 2,
      action: snackBarAction,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.green.shade900,

      duration: duration ?? const Duration(seconds: 4),
      content: _SnackBarMessage(
        title: title,
        message: message,
        icon: const Icon(Icons.info, color: Colors.green),
      ),
    ),
  );
}

void showErrorSnackBar(
    BuildContext context, {
      String? title,
      required String message,
      Duration? duration,
      bool clearCurrentSnackBar = false,
      SnackBarAction? action,
    }) {
  final scaffoldMessenger = ScaffoldMessenger.of(context);
  if (clearCurrentSnackBar) {
    scaffoldMessenger.clearSnackBars();
  }
  scaffoldMessenger.showSnackBar(
    SnackBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
      elevation: 2,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red.shade900,
      content: _SnackBarMessage(
        title: title,
        message: message,
        icon: const Icon(Icons.error, color: Colors.red),
      ),
      duration: duration ?? const Duration(seconds: 4),
      action: action,
    ),
  );
}

class _SnackBarMessage extends StatelessWidget {
  final Icon? icon;
  final String? title;
  final String message;

  const _SnackBarMessage({this.icon, this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 32),
      child: IntrinsicHeight(
        child: Row(
          children: [
            if (icon != null)
              Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      margin: const EdgeInsets.all(2),
                    ),
                  ),
                  icon!,
                ],
              ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null)
                    Text(
                      title!,
                      style: theme.textTheme.titleLarge!.copyWith(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  if (title != null) const SizedBox(height: 4),
                  Text(
                    message,
                    style: title == null
                        ? theme.textTheme.titleLarge!.copyWith(
                            fontSize: 14,
                            color: Colors.white,
                          )
                        : null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
