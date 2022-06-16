import 'package:flutter/material.dart';

class CustomRadioButton<Type> extends StatelessWidget {
  final String label;
  final TextStyle? labelStyle;
  final Type value;
  final ValueNotifier<Type> valueNotifier;
  final ThemeData? radioTheme;
  final Color? backgroundColor;
  const CustomRadioButton(
      {Key? key,
      required this.label,
      required this.value,
      required this.valueNotifier,
      this.labelStyle,
      this.radioTheme,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Type>(
      valueListenable: valueNotifier,
      builder: (_, selectedValue, __) {
        return ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 200.0),
          child: AspectRatio(
            aspectRatio: 1, // make a square
            child: OutlinedButton(
              onPressed: () {
                valueNotifier.value = value;
              },
              style: OutlinedButton.styleFrom(
                  elevation: 2.0,
                  side: BorderSide(
                      color: selectedValue == value
                          ? Theme.of(context).colorScheme.secondary
                          : Colors.grey.shade400,
                      width: 2),
                  padding: const EdgeInsets.all(16.0),
                  enableFeedback: true,
                  backgroundColor: backgroundColor ?? Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    label,
                    textAlign: TextAlign.center,
                    style: labelStyle,
                  ),
                  radioTheme != null
                      ? Theme(
                          data: radioTheme!,
                          child: Radio<Type>(
                            value: value,
                            groupValue: selectedValue,
                            onChanged: (value) {
                              valueNotifier.value = value as Type;
                            },
                          ),
                        )
                      : Radio<Type>(
                          value: value,
                          groupValue: selectedValue,
                          onChanged: (value) {
                            valueNotifier.value = value as Type;
                          },
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
