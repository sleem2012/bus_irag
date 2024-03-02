import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app.dart';
import 'di.dart';

void main() async {
  await Di.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // KStorage.i.erase;

  runApp(const RestartWidget(child: MyApp()));
}

class RestartWidget extends StatefulWidget {
  const RestartWidget({super.key, required this.child});

  final Widget child;

  static void restartApp(BuildContext context) =>
      context.findAncestorStateOfType<RestartWidgetState>()?.restartApp();

  @override
  RestartWidgetState createState() => RestartWidgetState();
}

class RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() => setState(() => key = UniqueKey());

  @override
  Widget build(BuildContext context) =>
      KeyedSubtree(key: key, child: widget.child);
}
