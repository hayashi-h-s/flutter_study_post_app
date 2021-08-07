import 'package:flutter/material.dart';

class ButtonSampleListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: _buildShrineTheme(),
      home: MyHomePage(),
    );
  }
}

// 参考サイト https://qiita.com/coka__01/items/30716f42e4a909334c9f

class MyHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  // Respond to button press
                },
                child: Text('TEXT BUTTON'),
              ),
              SizedBox(height: 8.0),
              OutlinedButton(
                onPressed: () {
                  // Respond to button press
                },
                child: Text("OUTLINED BUTTON"),
              ),
              SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () {
                  // Respond to button press
                },
                child: Text("CONTAINED BUTTON"),
              ),
              // Flutter1.22以降のみ
              ElevatedButton(
                child: const Text('Button'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  onPrimary: Colors.white,
                ),
                onPressed: () {},
              ),
              RaisedButton(
                child: const Text('Button'),
                color: Colors.orange,
                textColor: Colors.white,
                onPressed: () {},
              ),
              // Flutter1.22以降のみ
              ElevatedButton(
                child: const Text('Button'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
              ),
              RaisedButton(
                child: const Text('Button'),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {},
              ),
              // Flutter1.22以降のみ
              ElevatedButton(
                child: const Text('Button'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  onPrimary: Colors.black,
                  shape: const StadiumBorder(),
                ),
                onPressed: () {},
              ),
              RaisedButton(
                child: const Text('Button'),
                color: Colors.red,
                shape: const StadiumBorder(),
                onPressed: () {},
              ),
              // Flutter1.22以降のみ
              ElevatedButton(
                child: const Text('Button'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellow,
                  onPrimary: Colors.black,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
              ),
              RaisedButton(
                child: const Text('Button'),
                color: Colors.yellow,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {},
              ),
              RaisedButton(
                child: const Text('Button'),
                shape: const UnderlineInputBorder(),
                onPressed: () {},
              ),
              // Flutter1.22以降のみ
              OutlinedButton(
                child: const Text('Button'),
                style: OutlinedButton.styleFrom(
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: const BorderSide(),
                ),
                onPressed: () {},
              ),
              RaisedButton(
                child: const Text('Button'),
                color: Colors.white,
                shape: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                onPressed: () {},
              ),
              // Flutter1.22以降のみ
              OutlinedButton(
                child: const Text('Button'),
                style: OutlinedButton.styleFrom(
                  primary: Colors.black,
                  shape: const StadiumBorder(),
                  side: const BorderSide(color: Colors.green),
                ),
                onPressed: () {},
              ),
              RaisedButton(
                child: const Text('Button'),
                color: Colors.white,
                shape: const StadiumBorder(
                  side: BorderSide(color: Colors.green),
                ),
                onPressed: () {},
              ),
              RaisedButton(
                child: Text("Button"),
                color: Colors.white,
                shape: Border(
                  top: BorderSide(color: Colors.red),
                  left: BorderSide(color: Colors.blue),
                  right: BorderSide(color: Colors.yellow),
                  bottom: BorderSide(color: Colors.green),
                ),
                onPressed: () {},
              ),
              // Flutter1.22以降のみ
              ElevatedButton(
                child: const Text('Btn'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  shape: const CircleBorder(
                    side: BorderSide(
                      color: Colors.black,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
                onPressed: () {},
              ),
              RaisedButton(
                child: const Text('Btn'),
                color: Colors.white,
                shape: const CircleBorder(
                  side: BorderSide(
                    color: Colors.black,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
                onPressed: () {},
              ),
              // Flutter1.22以降のみ
              ElevatedButton(
                child: const Text('Button'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  onPrimary: Colors.black,
                  elevation: 16,
                ),
                onPressed: () {},
              ),
              RaisedButton(
                elevation: 16,
                child: const Text('Button'),
                onPressed: () {},
                color: Colors.orange,
              ),
              RaisedButton(
                child: const Text('Button'),
                onPressed: () {},
                highlightElevation: 16,
                highlightColor: Colors.blue,
                onHighlightChanged: (value) {},
              ),
              // Flutter1.22以降のみ
              ElevatedButton(
                child: const Text('Button'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[300],
                  onPrimary: Colors.purple,
                ),
                onPressed: () {},
              ),
              RaisedButton(
                child: const Text('Button'),
                onPressed: () {},
                splashColor: Colors.purple,
              ),
              // Flutter1.22以降のみ
              ElevatedButton.icon(
                icon: const Icon(
                  Icons.tag_faces,
                  color: Colors.white,
                ),
                label: const Text('Button'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                ),
                onPressed: () {},
              ),
              RaisedButton.icon(
                icon: const Icon(
                  Icons.tag_faces,
                  color: Colors.white,
                ),
                label: const Text('Button'),
                onPressed: () {},
                color: Colors.green,
                textColor: Colors.white,
              ),
              // Flutter1.22以降のみ
              TextButton(
                child: const Text('Button'),
                style: TextButton.styleFrom(
                  primary: Colors.black,
                ),
                onPressed: () {},
              ),
              FlatButton(
                child: const Text('Button'),
                textColor: Colors.black,
                onPressed: () {},
              ),
              // Flutter1.22以降のみ
              OutlinedButton(
                child: const Text('Button'),
                style: OutlinedButton.styleFrom(
                  primary: Colors.black,
                ),
                onPressed: () {},
              ),
              OutlineButton(
                child: const Text('Button'),
                onPressed: () {},
              ),
              // Flutter1.22以降のみ
              OutlinedButton(
                child: const Text('Button'),
                style: OutlinedButton.styleFrom(
                  primary: Colors.black,
                ),
                onPressed: () {},
              ),
              OutlineButton(
                child: const Text('Button'),
                onPressed: () {},
              ),
              // Flutter1.22以降のみ
              ElevatedButton(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Colors.orange[300],
                        Colors.orange[500],
                        Colors.orange[700],
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: const Text('Gradient Button'),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                ),
                onPressed: () {},
              ),
              RaisedButton(
                onPressed: () {},
                textColor: Colors.white,
                padding: const EdgeInsets.all(0),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Colors.orange[300],
                        Colors.orange[500],
                        Colors.orange[700],
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: const Text('Gradient Button'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: _shrineColorScheme,
    toggleableActiveColor: shrinePink400,
    accentColor: shrineBrown900,
    primaryColor: shrinePink100,
    buttonColor: shrinePink100,
    scaffoldBackgroundColor: shrineBackgroundWhite,
    cardColor: shrineBackgroundWhite,
    textSelectionColor: shrinePink100,
    errorColor: shrineErrorRed,
    primaryIconTheme: _customIconTheme(base.iconTheme),
    textTheme: _buildShrineTextTheme(base.textTheme),
    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
    iconTheme: _customIconTheme(base.iconTheme),
  );
}

IconThemeData _customIconTheme(IconThemeData original) {
  return original.copyWith(color: shrineBrown900);
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
        button: base.button.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: shrineBrown900,
        bodyColor: shrineBrown900,
      );
}

const ColorScheme _shrineColorScheme = ColorScheme(
  primary: shrinePink400,
  primaryVariant: shrineBrown900,
  secondary: shrinePink50,
  secondaryVariant: shrineBrown900,
  surface: shrineSurfaceWhite,
  background: shrineBackgroundWhite,
  error: shrineErrorRed,
  onPrimary: shrineBrown900,
  onSecondary: shrineBrown900,
  onSurface: shrineBrown900,
  onBackground: shrineBrown900,
  onError: shrineSurfaceWhite,
  brightness: Brightness.light,
);

const Color shrinePink50 = Color(0xFFFEEAE6);
const Color shrinePink100 = Color(0xFFFEDBD0);
const Color shrinePink300 = Color(0xFFFBB8AC);
const Color shrinePink400 = Color(0xFFEAA4A4);

const Color shrineBrown900 = Color(0xFF442B2D);
const Color shrineBrown600 = Color(0xFF7D4F52);

const Color shrineErrorRed = Color(0xFFC5032B);

const Color shrineSurfaceWhite = Color(0xFFFFFBFA);
const Color shrineBackgroundWhite = Colors.white;

const defaultLetterSpacing = 0.03;
