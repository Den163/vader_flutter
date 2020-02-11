import 'package:flutter/material.dart';
import 'package:vader_di/vader.dart';
import 'package:vader_flutter/vader_flutter.dart';

void main() {
  runApp(
    ModuleValueInjector<String>(
      valueToResolve: 'Hello world',
      child: DependentWidget<String>(
        builder: (val) => Text(val.toString()),
      ),
    )
  );
}

class TestableWidget<T extends Object> extends StatelessWidget {
  final T valueToResolve;

  const TestableWidget({
    Key key,
    this.valueToResolve
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModuleValueInjector(
      valueToResolve: valueToResolve,
      child: DependentWidget<T>(
        builder: (val) => Text(val.toString()),
      ),
    );
  }
}

class ModuleValueInjector<T> extends ModuleInjector {
  final Widget child;
  final T valueToResolve;

  ModuleValueInjector({
    Key key,
    @required this.child,
    @required this.valueToResolve
  }) : super(key: key);

  @override
  void configure(DiContainer container) {
    container.bind<T>().toValue(valueToResolve);
  }
}