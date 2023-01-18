import 'package:flutter/material.dart';
import 'package:rep4/utils/windows_title_bar.dart';

import '../widget/change_theme_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          WindowsTitleBar(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Hello"),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
