import 'package:route5972/plot/view_model/dialog_option_view_model.dart';

class DialogViewModel {
  String text;
  String? backgroundImage;
  String? leftImage;
  String? rightImage;
  List<DialogOptionViewModel> options;

  DialogViewModel({
    required this.text,
    this.backgroundImage,
    this.leftImage,
    this.rightImage,
    required this.options,
  });
}
