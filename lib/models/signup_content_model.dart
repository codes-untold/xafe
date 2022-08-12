class SignupContentModel {
  String mainText;
  String subText;
  String buttonText;
  Enum signUpSequenceValue;
  bool hasPasswordToggleButton;
  int progressBarNumber;

  SignupContentModel({
    required this.mainText,
    required this.subText,
    required this.progressBarNumber,
    required this.signUpSequenceValue,
    this.buttonText = "Next",
    this.hasPasswordToggleButton = false,
  });
}
