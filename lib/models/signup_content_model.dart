class SignupContentModel {
  String mainText;
  String subText;
  String buttonText;
  bool hasPasswordToggleButton;
  double progressBarNumber;

  SignupContentModel({
    required this.mainText,
    required this.subText,
    required this.progressBarNumber,
    this.buttonText = "Next",
    this.hasPasswordToggleButton = false,
  });
}
