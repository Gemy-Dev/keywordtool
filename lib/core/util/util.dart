class Util {
  static const List<String> englisAlphabets = [
    " ",
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];
  static const List<String> arabicAlphabet = [
    " "
        "ا", // alef
    "ب", // ba
    "ت", // ta
    "ث", // tha
    "ج", // jim
    "ح", // ha
    "خ", // kha
    "د", // dal
    "ذ", // dha
    "ر", // ra
    "ز", // zay
    "س", // sin
    "ش", // shin
    "ص", // sad
    "ض", // dhaad
    "ط", // thaa'
    "ظ", // za
    "ع", // ain
    "غ", // ghayn
    "ف", // fa
    "ق", // qaf
    "ك", // kaf
    "ل", // lam
    "م", // mim
    "ن", // noon
    "ه", // haa'
    "و", // waaw
    "ي", // yaa'
  ];
  static List<String> checkInputType(String input) {
    print(input.contains(RegExp(r'[\u0600-\u06FF]')));
    if (input.contains(RegExp(r'[\u0600-\u06FF]'))) {
      return arabicAlphabet;
    } else {
      return englisAlphabets;
    }
  }
}
