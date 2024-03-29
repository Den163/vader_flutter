import 'package:flutter/widgets.dart';

typedef Route RouteBuilder(RouteSettings settings);

/// Nested navigator module with it's own context.
/// You can use it as a child of [ModuleInjector] to 
/// get low independent module with it's dependencies
/// or just like a nested [Navigator].
/// 
/// Note if you want working hero animations,
/// you need to add a [HeroController] into routes parameter 
/// ([HeroController] is a subclass of a [NavigatorObserver])
class NavigatorModule extends StatefulWidget {
  final Map<String, RouteBuilder> routes;
  final RouteBuilder? onUnknownRoute;
  final List<NavigatorObserver> observers;
  final String? initialRoute;
  final GlobalKey<NavigatorState>? navigatorKey;

  NavigatorModule({
    Key? key,
    required this.routes,
    this.initialRoute,
    this.observers = const <NavigatorObserver>[],
    this.onUnknownRoute,
    this.navigatorKey,
  }) :
    assert(observers != null),
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
  GlobalKey<NavigatorState>? _navigatorKey;

  @override
  void initState() {
    _navigatorKey = widget.navigatorKey ?? GlobalKey<NavigatorState>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _navigatorKey,
      onGenerateRoute: (settings) {
        final route = widget.routes[settings.name];
        if (route == null)
          throw StateError("Can't find route with name: ${settings.name}");

        return route(settings);
      },
      initialRoute: widget.initialRoute,
      onUnknownRoute: widget.onUnknownRoute,
      observers: widget.observers,
    );
  }
}
