String getAlternativeLetter(int index) {
  String radix = index.toRadixString(16);
  bool big = radix.length > 1;

  return big
      ? String.fromCharCode(
          int.parse("0x00${int.parse(radix[0]) + 4}${radix[1]}"))
      : String.fromCharCode(int.parse("0x004$radix"));
}