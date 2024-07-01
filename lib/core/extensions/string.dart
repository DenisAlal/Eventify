part of core;

extension StringExtension on String {
  String formatCarNumberRegion() {
    if (length > 7) {
      return ' ${this.substring(6)}';
    }
    return '';
  }

  String formatCarNumberFirst() {
    if (length > 7) {
      return '${this[0]} ${this.substring(1, 4)} ${this.substring(4, 6)}';
    }
    return this;
  }

  String formatCarNumber() {
    if (length > 7) {
      return '${this[0]} ${this.substring(1, 4)} ${this.substring(4, 6)} ${this.substring(6)}';
    }
    return this;
  }

  bool get isValidEmail {
    final regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

    return regex.hasMatch(this);
  }

  bool get isValidName {
    final regex = RegExp(r'^[А-яЁё\s\-]+$');

    return regex.hasMatch(this);
  }

  bool get isValidPassword {
    final lengthCheck = length >= 6 && length <= 30;

    final regex = RegExp(r'^[0-9A-z\s\-]+$');
    final symbolsCheck = regex.hasMatch(this);

    return lengthCheck && symbolsCheck;
  }

  bool get hasOnlyNumbers {
    final regex = RegExp(r'^[0-9]+$');

    return regex.hasMatch(this);
  }

  Iterable<RegExpMatch> get phoneMatches {
    final regex = RegExp(r'^(\+7|8)*[- ]*\(*(\d{3}){1}\)*[- ]*(\d{3}){1}[- ]*(\d{2}){1}[- ]*(\d{2}){1}$');

    return regex.allMatches(this);
  }

  bool get isValidPhone {
    final regex = RegExp(r'^(\+7|8)*[- ]*\(*(\d{3}){1}\)*[- ]*(\d{3}){1}[- ]*(\d{2}){1}[- ]*(\d{2}){1}$');

    return regex.hasMatch(this);
  }

  bool get isValidShortPhone {
    final lengthCheck = length == 10;

    final regex = RegExp(r'^[0-9]+$');
    final symbolsCheck = regex.hasMatch(this);

    return lengthCheck && symbolsCheck;
  }

  bool get isValidCarNumber {
    String buff = replaceAll(' ', '');
    buff = buff.replaceAll('|', '');

    if (buff.length < 8 || buff.length > 9) {
      return false;
    }

    var numberRegExp = RegExp(r'^\d+$');
    var symbolRegExp = RegExp(r'^[а-яА-Я]+$');


    var first = buff[0];
    var number = buff.substring(1, 4);
    var last = buff.substring(4, 6);
    var region = buff.substring(6);

    var a = symbolRegExp.hasMatch(first);
    var a1 = numberRegExp.hasMatch(number);
    var a2 = symbolRegExp.hasMatch(last);
    var a3 = numberRegExp.hasMatch(region);

    var result = (a && a1 && a2 && a3);

    return result;
  }

  bool get isValidCode {
    final lengthCheck = length == 4;

    final regex = RegExp(r'^[0-9]+$');
    final symbolsCheck = regex.hasMatch(this);

    return lengthCheck && symbolsCheck;
  }

  String get maskedPhone {
    if (!isValidPhone) {
      return this;
    }

    if (phoneMatches.isEmpty) {
      return this;
    }

    final match = phoneMatches.first;

    final groups = match.groups([1, 2, 3, 4, 5]);

    for (final index in [1, 2]) {
      groups[index] = groups[index]?.replaceAll(RegExp(r'[0-9]'), "*");
    }

    final result = "${groups[0]} (${groups[1]}) ${groups[2]}-${groups[3]}-${groups[4]}";

    return result;
  }

  String get maskedEmail {
    final atIndex = indexOf("@");

    if (atIndex < 0) {
      return this;
    }

    final replacingCount = (atIndex / 2).floor();

    return replaceRange(
      0,
      replacingCount,
      List.generate(replacingCount, (index) => "*").join(),
    );
  }

  String get fileName => (split('/').last.split('.')..removeLast()).join('.');

  String get fileType => split('.').last;

  String get fullFileName => "$fileName.$fileType";

  String get directoryPath => (split('/')..removeLast()).join('/');
}
