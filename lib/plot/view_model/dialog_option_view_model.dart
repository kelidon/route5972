import 'package:flutter/cupertino.dart';

class DialogOptionViewModel {
  final String text;
  final VoidCallback onSelected;

  DialogOptionViewModel({required this.text, required this.onSelected});
}
