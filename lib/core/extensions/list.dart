part of core;

extension ListExtension on List {
  List removeValue({
    required dynamic value,
    int? minResultLength,
    int? maxResultLength,
  }) {
    final result = where((element) => element != value).toList();

    if (minResultLength != null && result.length < minResultLength) {
      throw Exception(
        "Min length is less than desired",
      );
    }

    if (maxResultLength != null && result.length > maxResultLength) {
      throw Exception(
        "Max length exceeded",
      );
    }

    return result;
  }

  T? firstWhereOrNull<T>(
      bool Function(T) test, {
        bool fromEnd = false,
      }) {
    try {
      final index = indexWhereOrNull<T>(test, fromEnd: fromEnd);

      if (index == null) {
        return null;
      }

      return elementAt(index);
    } on StateError catch (_) {
      return null;
    } catch (error) {
      dev.log(error.toString());

      return null;
    }
  }

  int? indexWhereOrNull<T>(
      bool Function(T) test, {
        bool fromEnd = false,
      }) {
    try {
      if (fromEnd) {
        final result = (toList() as List<T>).reversed.toList().indexWhere(test);

        if (result < 0) {
          return null;
        }

        return length - 1 - result;
      } else {
        final result = (toList() as List<T>).indexWhere(test);

        if (result < 0) {
          return null;
        }

        return result;
      }
    } on StateError catch (_) {
      return null;
    } catch (error) {
      dev.log(error.toString());

      return null;
    }
  }

  List<T> withoutNulls<T>() => fold(
    [],
        (previousValue, element) {
      if (element != null) {
        previousValue.add(element);
      }

      return previousValue;
    },
  );

  bool areNulls() => fold(
    true,
        (previousValue, element) => previousValue && element == null,
  );

  List<T> withDivider<T>({required T divider}) => asMap().entries.fold(
    [],
        (previousValue, element) {
      previousValue.add(element.value);

      if (element.key < length - 1) {
        previousValue.add(divider);
      }

      return previousValue;
    },
  );

  bool isEqual(List other) =>
      length == other.length && !any((element) => !other.contains(element));
}
