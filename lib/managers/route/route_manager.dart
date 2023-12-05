import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:music/screens/home_screen/home_screen.dart';
import 'package:music/screens/playlist_screen/playlist_screen.dart';
import 'package:music/screens/splash_screen/splash_screen.dart';

class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final argument = settings.arguments;
    switch (settings.name) {
      case '/SplashScreenPage':
        return CustomPageRouteFastTransition(
          const SplashScreen(),
        );
      case '/HomeScreenPage':
        return CustomPageRouteFastTransition(
          const HomeScreen(),
        );
      case '/HomeScreenPage/PlayListScreen':
        return CustomPageRouteFastTransition(
          PlayListScreen(
            playListName: argument as List<String>,
          ),
        );

      default:
        return CustomPageRouteSlowTransition(
          const Scaffold(
            body: SafeArea(
              child: Center(
                child: Text("Loading.."),
              ),
            ),
          ),
        );
    }
  }
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

class CustomPageRouteSlowTransition<T> extends PageRoute<T> {
  CustomPageRouteSlowTransition(
    this.child,
  );

  @override
  Color get barrierColor => Colors.black;

  @override
  String get barrierLabel => "";

  final Widget child;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 600);
}

class CustomPageRouteFastTransition<T> extends PageRoute<T> {
  CustomPageRouteFastTransition(
    this.child,
  );

  @override
  Color get barrierColor => Colors.black;

  @override
  String get barrierLabel => "";

  final Widget child;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);
}
