part of core;

extension DatetimeExtension on DateTime {
  bool isTheSameDate(DateTime other) {
    if (year != other.year) {
      return false;
    }

    if (month != other.month) {
      return false;
    }

    if (day != other.day) {
      return false;
    }

    return true;
  }

  static DateTime parseWithLocal(String data) {
    final moscow = tz.getLocation('Europe/Moscow');
    var moscowTime = tz.TZDateTime.from(DateTime.parse(data), moscow);
    return moscowTime;
  }

  String get chatTime {
    var formatTime = DateFormat('HH:mm');
    return formatTime.format(this);
  }

  String get commentTime {
    final difference = DateTime.now().difference(this);
    var formatTime = DateFormat('HH:mm');
    var formatDate = DateFormat('dd MMM', 'ru-RU');

    if (difference.inHours < 24) {
      return "Сегодня в ${formatTime.format(this)}";
    }

    if (difference.inHours > 24 && difference.inHours < 48) {
      return "Вчера в ${formatTime.format(this)}";
    }
    return "${formatDate.format(this)} в ${formatTime.format(this)}";
  }

  String get howLongAgo {
    final difference = DateTime.now().difference(this);

    if (difference.inDays > 1) {
      return "${difference.inDays} д назад";
    }

    if (difference.inHours > 1) {
      return "${difference.inHours} ч назад";
    }

    if (difference.inMinutes > 1) {
      return "${difference.inMinutes} мин назад";
    }

    return "недавно";
  }

  static Duration secondsBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day, from.hour, from.minute, from.second);
    to = DateTime(to.year, to.month, to.day, to.hour, to.minute, to.second);
    return to.difference(from);
  }

  static String formatTimerData(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60).abs());
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60).abs());
    return '${duration.inHours != 0 ? '${twoDigits(duration.inHours)}:' : ''}$twoDigitMinutes:$twoDigitSeconds';
  }
}
