import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

final buttonColors = WindowButtonColors(
    iconNormal: Color.fromARGB(255, 104, 104, 104),
    mouseOver: Color.fromARGB(255, 126, 126, 126),
    mouseDown: const Color.fromARGB(255, 42, 171, 190),
    iconMouseOver: Color.fromARGB(255, 255, 255, 255),
    iconMouseDown: const Color(0xFFFFD500));

final closeButtonColors = WindowButtonColors(
    mouseOver: const Color(0xFFD32F2F),
    mouseDown: Color.fromARGB(255, 53, 53, 53),
    iconNormal: Color.fromARGB(255, 104, 104, 104),
    iconMouseOver: Colors.white);

class WindowButtons extends StatelessWidget {
  const WindowButtons({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: buttonColors),
        MaximizeWindowButton(colors: buttonColors),
        CloseWindowButton(colors: closeButtonColors),
      ],
    );
  }
}
