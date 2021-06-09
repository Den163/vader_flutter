import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vader_flutter/src/dependent_widget.dart';
import 'package:vader_flutter/src/module_injector.dart';
import 'package:vader_flutter/vader_flutter.dart';

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
    Key? key,
    required this.valueToResolve
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
    Key? key,
    required this.child,
    required this.valueToResolve
  }) : super(key: key);

  @override
  void configure(DiContainer container) {
    container.bind<T>().toValue(valueToResolve);
  }
}

