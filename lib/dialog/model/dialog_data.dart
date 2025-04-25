import 'dart:ui';

class DialogData {
  final String? backgroundImagePath;
  final String? leftImagePath;
  final String? rightImagePath;
  final String text;
  final List<DialogOption> options;

  DialogData({
    this.backgroundImagePath,
    this.leftImagePath,
    this.rightImagePath,
    required this.text,
    this.options = const [],
  });
}

class DialogOption {
  final String label;
  final VoidCallback onSelected;

  DialogOption({required this.label, required this.onSelected});
}
