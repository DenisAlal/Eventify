part of presentation;

abstract class AppValueValidator {
  static String? notNull(dynamic value) {
    if (value == null) return "Это поле необходимо заполнить";

    return null;
  }

  static String? notEmpty(Iterable? value) {
    if (value == null) return "Это поле необходимо заполнить";

    if (value.isEmpty) return "Это поле необходимо заполнить";

    return null;
  }
}

class AppTextValidator {
  static String? name(String? value) {
    if (value == null || value.isEmpty) return "Это поле необходимо заполнить";

    if (value.length < 2) return "Не менее 2 символов";

    if (!value.isValidName) {
      return "Только кириллица, пробел и тире";
    }

    return null;
  }


  static String? password(String? value) {
    if (value == null || value.isEmpty) return "Это поле необходимо заполнить";

    if (value.length < 6) return "Не менее 6 символов";

    if (value.length > 30) return "Не больше 30 символов";

    if (!value.isValidPassword) {
      return "Только латиница, цифры, пробел и тире";
    }

    return null;
  }

  static String? email(String? value) {
    if (value == null || value.isEmpty) return "Это поле необходимо заполнить";

    if (!value.isValidEmail) {
      return "Формат email@example.com";
    }

    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.isEmpty) return "Это поле необходимо заполнить";

    if (!value.isValidPhone) {
      return "Формат +7 (9xx) xxx-xx-xx";
    }

    return null;
  }

}