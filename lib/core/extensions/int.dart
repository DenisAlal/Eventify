extension IntExtension on int {
  String roundThousand() {
    if (this > 1000) {
      return '${(this / 1000).floor()}K}';
    }
    return toString();
  }
}