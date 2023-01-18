# win17

Flutter Windows desktop application template for building on top of. It has sytem theming and dark mode available though a switch widget. Customized windows title bar.
## Deployment Setup

Clone the project
```bash
  git clone https://github.com/ckiggundu/win17.git
```
Go to the project directory
```bash
  cd win17-develop
```
Install dependencies

```bash
  flutter pub get
```
Start the device emulator
```bash
  flutter run
```
## Screenshots

[![Screenshot-20230118-050936.png](https://i.postimg.cc/nrtm0dL3/Screenshot-20230118-050936.png)](https://postimg.cc/G8q9pxGD)

[![Screenshot-20230118-051010.png](https://i.postimg.cc/BbcKyxL4/Screenshot-20230118-051010.png)](https://postimg.cc/FkzzkkVB)
## File Structure

[![Screenshot-20230118-051145.png](https://i.postimg.cc/mrJCFZWf/Screenshot-20230118-051145.png)](https://postimg.cc/94Pr6hfJ)
## Usage/Examples

main.dart
```dart
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rep4/provider/theme_provider.dart';

import 'screens/main_page.dart';

void main() {
  runApp(const MyApp());

  // customize initial window size
  doWhenWindowReady(() {
    final win = appWindow;
    const initialSize = Size(800, 600);
    win.minSize = initialSize;
    win.size = initialSize;
    win.alignment = Alignment.center;
    win.title = "Custom window with Flutter";
    win.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);

          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            home: const MainPage(),
          );
        },
      );
}

```

theme_provider.dart

```dart
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: const ColorScheme.dark(),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
  );
}


```
change_theme_widget.dart

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rep4/provider/theme_provider.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  const ChangeThemeButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Switch.adaptive(
      value: themeProvider.isDarkMode,
      onChanged: (value) {
        final provider = Provider.of<ThemeProvider>(context, listen: false);
        provider.toggleTheme(value);
      },
    );
  }
}

```
main_page.dart

```dart
import 'package:flutter/material.dart';

import '../widget/change_theme_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          ChangeThemeButtonWidget(),
        ],
        title: const Text('Hello'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Hello"),
              SizedBox(
                height: 10,
              ),
              ChangeThemeButtonWidget()
            ],
          ),
        ),
      ),
    );
  }
}

```



## Acknowledgements

 - [Johannes Milke](https://github.com/JohannesMilke/theme_example)

- [Bits Dojo](https://github.com/bitsdojo/bitsdojo_window)

## License

[MIT](https://github.com/ckiggundu/win17/blob/develop/LICENSE)

