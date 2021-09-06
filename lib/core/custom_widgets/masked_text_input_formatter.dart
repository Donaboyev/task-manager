import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MaskedTextInputFormatter extends TextInputFormatter {
  final String? mask;
  final String? separator;

  MaskedTextInputFormatter({
    required this.mask,
    required this.separator,
  }) {
    assert(mask != null);
    assert(separator != null);
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text;
    String newText = newValue.toJSON()['text'].toString();
    if (text.length > 0) {
      if (text.length > oldValue.text.length) {
        if (text.length > mask!.length) return oldValue;
        if (text.length < mask!.length && mask![text.length - 1] == separator) {
          return TextEditingValue(
            text:
                '${oldValue.text}$separator${text.substring(text.length - 1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
      } else {
        if (newText.substring(newText.length - 1) == separator) {
          return TextEditingValue(
            text: newValue.text.substring(0, newValue.text.length - 1),
            selection: TextSelection.collapsed(
              offset: newValue.selection.end - 1,
            ),
          );
        }
      }
      return TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(
          offset: newValue.selection.end,
        ),
      );
    }
    return newValue;
  }
}
