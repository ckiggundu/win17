import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:rep4/widget/change_theme_widget.dart';

import 'windows_buttons.dart';

class WindowsTitleBar extends StatelessWidget {
  const WindowsTitleBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            WindowTitleBarBox(
              child: Row(
                children: [
                  ChangeThemeButtonWidget(),
                  Expanded(child: MoveWindow()),
                  const WindowButtons()
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
