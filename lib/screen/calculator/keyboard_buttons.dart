import 'constants.dart';
import "package:flutter/material.dart";

typedef void CallbackButtonTap({String buttonText});


class KeyboardButtons extends StatelessWidget {
  KeyboardButtons({required this.buttons, required this.onTap});

  final List<String> buttons;
  final CallbackButtonTap onTap;

  bool _colorTextButtons(String button) {
    return (button == DEL_SIGN ||
        button == DECIMAL_POINT_SIGN ||
        button == CLEAR_ALL_SIGN ||
        button == MODULAR_SIGN ||
        button == PLUS_SIGN ||
        button == MINUS_SIGN ||
        button == MULTIPLICATION_SIGN ||
        button == DIVISION_SIGN ||
        button == EXCHANGE_CALCULATOR ||
        button == PI ||
        button == SQUARE_ROOT_SIGN ||
        button == POWER_SIGN ||
        button == LN_SIGN ||
        button == LG_SIGN ||
        button == SIN_SIGN ||
        button == COS_SIGN ||
        button == TAN_SIGN ||
        button == RAD_SIGN ||
        button == DEG_SIGN ||
        button == ARCSIN_SIGN ||
        button == ARCCOS_SIGN ||
        button == ARCTAN_SIGN ||
        button == LN2_SIGN ||
        button == E_NUM ||
        button == LEFT_QUOTE_SIGN ||
        button == RIGHT_QUOTE_SIGN);
  }

  bool _fontSize(String button) {
    return (button == LN_SIGN ||
        button == LG_SIGN ||
        button == SIN_SIGN ||
        button == COS_SIGN ||
        button == TAN_SIGN ||
        button == RAD_SIGN ||
        button == DEG_SIGN ||
        button == ARCSIN_SIGN ||
        button == ARCCOS_SIGN ||
        button == ARCTAN_SIGN ||
        button == LN2_SIGN ||
        button == LEFT_QUOTE_SIGN ||
        button == RIGHT_QUOTE_SIGN);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: (buttons[0] == EQUAL_SIGN)
                ? Colors.yellow
                : Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 10.0),
          ),
          onPressed: () => onTap(buttonText: buttons[0]),
          child: Text(
            buttons[0],
            style: TextStyle(
              color: (_colorTextButtons(buttons[0]))
                  ? const Color.fromARGB(255, 247, 137, 2)
                  : (buttons[0] == EQUAL_SIGN)
                      ? Colors.black // Change this to the desired color
                      : Colors.black,
              fontSize: _fontSize(buttons[0]) ? 18 : 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
