import 'package:flutter/widgets.dart';

typedef Route RouteBuilder(RouteSettings settings);

/// Nested navigator module.
/// Note if you want working hero animations,
/// you need to add a HeroController into route observers list
class NavigatorModule extends StatefulWidget {
  final Map<String, RouteBuilder> routes;
  final RouteBuilder onUnknownRoute;
  final List<NavigatorObserver> observers;
  final String initialRoute;

  NavigatorModule({
    Key key,
    @required this.routes,
    this.initialRoute,
    this.observers,
    this.onUnknownRoute
  }) :
    assert(
      routes.containsKey('/'),
      'A Routes Map for NavigatorModule '
      'doesn\'t contains a builder with key \'/\', '
      'Note that it does to define a root route'),
    super(key: key);

  @override
  _NavigatorModuleState createState() => _NavigatorModuleState();
}

class _NavigatorModuleState extends State<NavigatorModule> {
  GlobalKey<NavigatorState> _navigatorKey;

  @override
  void initState() {
    _navigatorKey = GlobalKey<NavigatorState>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _navigatorKey.currentState
        .maybePop().then((mb) => !mb),
      child: Navigator(
        key: _navigatorKey,
        onGenerateRoute: (settings) => widget.routes[settings.name](settings),
        initialRoute: widget.initialRoute,
        onUnknownRoute: widget.onUnknownRoute,
        observers: widget.observers,
      ),
    );
  }
}
