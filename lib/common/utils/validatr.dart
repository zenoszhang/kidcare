bool zhIsEmail(String? input) {
  if (input == null || input.isEmpty) {
    return false;
  }
  String regexEmail = r"^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$";
  return RegExp(regexEmail).hasMatch(input);
}

bool zhIsMobile(String? input) {
  if (input == null || input.isEmpty) {
    return false;
  }
  String regexMoile =
      r"^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$";
  return RegExp(regexMoile).hasMatch(input);
}

bool zhIsName(String? input) {
  if (input == null || input.isEmpty) {
    return false;
  }
  String regexName = r"[ZA-ZZa-z\u4e00-\u9fa5]";
  return RegExp(regexName).hasMatch(input);
}

bool zhCheckStringLength(String? input, int length) {
  if (input == null || input.isEmpty) {
    return false;
  }
  return input.length >= length;
}
