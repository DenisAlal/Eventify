part of presentation;

class TextFormatter extends TextInputFormatter {
  final String sample;
  final List<String> separators;
  final List<bool Function(String)> changeChecks;

  TextFormatter({
    required this.sample,
    required this.separators,
    required this.changeChecks,
  });

  factory TextFormatter.phone() => TextFormatter(
        sample: "+7 (9xx) xxx-xx-xx",
        separators: [" ", "(", ")", "-", "+", "7", "9"],
        changeChecks: [(change) => change.hasOnlyNumbers],
      );

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.length > oldValue.text.length) {
      final change = newValue.text.substring(oldValue.text.length);

      final changeChecksResult = changeChecks.fold(
        true,
        (previousValue, element) => previousValue && element(change),
      );

      if (!changeChecksResult) {
        return oldValue;
      }

      if (newValue.text.length > sample.length) {
        return oldValue;
      }

      if (newValue.text.length < sample.length) {
        // final addSeparatorBefore =
        //     separators.contains(sample[newValue.text.length - 1]);

        // if (addSeparatorBefore) {
        //   var separatorSubstring = sample.substring(newValue.text.length - 1);
        //   final newIndex = separatorSubstring.indexOf("x");

        //   separatorSubstring = separatorSubstring.substring(0, newIndex);

        //   final text =
        //       "${oldValue.text}${newValue.text[newValue.text.length - 1]}$separatorSubstring";
        //   final offset = newIndex + oldValue.text.length + 1;

        //   return TextEditingValue(
        //     text: text,
        //     selection: TextSelection.collapsed(
        //       offset: offset,
        //     ),
        //   );
        // }

        final addSeparatorAfter =
            separators.contains(sample[newValue.text.length]);

        if (addSeparatorAfter) {
          var separatorSubstring = sample.substring(newValue.text.length);
          final newIndex = separatorSubstring.indexOf("x");

          separatorSubstring = separatorSubstring.substring(0, newIndex);

          final text =
              "${oldValue.text}${newValue.text[newValue.text.length - 1]}$separatorSubstring";
          final offset = newIndex + oldValue.text.length + 1;

          return TextEditingValue(
            text: text,
            selection: TextSelection.collapsed(
              offset: offset,
            ),
          );
        }
      }
    }

    if (newValue.text.length < oldValue.text.length) {
      // final removeSeparatorBefore =
      //     separators.contains(sample[max(0, newValue.text.length - 1)]);

      // if (removeSeparatorBefore) {
      //   final sampleSubstring = sample.substring(0, newValue.text.length - 1);
      //   final newIndex = sampleSubstring.lastIndexOf("x");

      //   if (newIndex < 0) {
      //     final newSampleIndex = sample.indexOf("x");
      //     final sampleSubstring = sample.substring(0, newSampleIndex);

      //     return TextEditingValue(
      //       text: sampleSubstring,
      //       selection: TextSelection.collapsed(
      //         offset: newSampleIndex,
      //       ),
      //     );
      //   }

      //   final oldValueSubstring = oldValue.text.substring(0, newIndex + 1);

      //   final text = oldValueSubstring;
      //   final offset = newIndex + 1;

      //   return TextEditingValue(
      //     text: text,
      //     selection: TextSelection.collapsed(
      //       offset: offset,
      //     ),
      //   );
      // }

      final removeSeparatorAfter =
          separators.contains(sample[max(0, newValue.text.length)]);

      if (removeSeparatorAfter) {
        var sampleSubstring = sample.substring(0, newValue.text.length);
        var newIndex = sampleSubstring.lastIndexOf("x");

        if (newIndex < 0) {
          final newSampleIndex = sample.indexOf("x");
          final sampleSubstring = sample.substring(0, newSampleIndex);

          return TextEditingValue(
            text: sampleSubstring,
            selection: TextSelection.collapsed(
              offset: newSampleIndex,
            ),
          );
        }

        sampleSubstring = sample.substring(0, newIndex);
        newIndex = sampleSubstring.lastIndexOf("x");

        if (newIndex < 0) {
          final newSampleIndex = sample.indexOf("x");
          final sampleSubstring = sample.substring(0, newSampleIndex);

          return TextEditingValue(
            text: sampleSubstring,
            selection: TextSelection.collapsed(
              offset: newSampleIndex,
            ),
          );
        }

        final oldValueSubstring = oldValue.text.substring(0, newIndex + 1);

        final text = oldValueSubstring;
        final offset = newIndex + 1;

        return TextEditingValue(
          text: text,
          selection: TextSelection.collapsed(
            offset: offset,
          ),
        );
      }
    }

    return newValue;
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

