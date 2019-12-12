import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vader_di/src/di_module.dart';
import 'package:vader_flutter/src/dependent_widget.dart';
import 'package:vader_flutter/src/module_injector.dart';


void main() {
  testWidgets(
  'Testable widget resolves value as expected',
  (WidgetTester tester) async {
    final expectedValue = 3;
    await tester.pumpWidget(
      MaterialApp(home: TestableWidget(valueToResolve: expectedValue)));

    final finder = find.text(expectedValue.toString());
    expect(finder, findsOneWidget);
  });
}

class TestableWidget<T extends Object> extends StatelessWidget {
  final T valueToResolve;

  const TestableWidget({
    Key key,
    this.valueToResolve
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModuleInjectorMock(
      valueToResolve: valueToResolve,
      child: DependentWidget<T>(
        builder: (val) => Text(val.toString()),
      ),
    );
  }
}

class ModuleInjectorMock<T> extends ModuleInjector {
  final Widget child;
  final T valueToResolve;

  ModuleInjectorMock({
    Key key,
    @required this.child,
    @required this.valueToResolve
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }

  @override
  void configure(DiModule module) {
    module.bind<T>().toValue(valueToResolve);
  }
}

