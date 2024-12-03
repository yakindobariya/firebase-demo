import 'package:flutter/material.dart';

class CustomNavigator extends StatefulWidget {
  final Widget initialPage;

  const CustomNavigator({Key? key, required this.initialPage}) : super(key: key);

  static _CustomNavigatorState? of(BuildContext context) {
    return context.findAncestorStateOfType<_CustomNavigatorState>();
  }

  @override
  _CustomNavigatorState createState() => _CustomNavigatorState();
}

class _CustomNavigatorState extends State<CustomNavigator> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  void push(Widget page) {
    _navigatorKey.currentState?.push(_buildPageRoute(page));
  }

  void pop() {
    if (_navigatorKey.currentState?.canPop() ?? false) {
      _navigatorKey.currentState?.pop();
    }
  }

  Route _buildPageRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, animation, __, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _navigatorKey,
      onGenerateRoute: (_) => MaterialPageRoute(
        builder: (_) => widget.initialPage,
      ),
    );
  }
}
