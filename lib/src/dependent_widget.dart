import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:vader_di/vader.dart';

class DependentWidget<T> extends StatelessWidget {
  final Widget Function(T) builder;

  const DependentWidget({
    Key? key,
    required this.builder
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final container = Provider.of<DiContainer>(context);

    return builder(
      container.resolve<T>(),
    );
  }
}

class DependentWidget2<T1, T2> extends StatelessWidget {
  final Widget Function(T1, T2) builder;

  const DependentWidget2({
    Key? key,
    required this.builder
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final container = Provider.of<DiContainer>(context);

    return builder(
      container.resolve<T1>(),
      container.resolve<T2>(),
    );
  }
}

class DependentWidget3<T1, T2, T3> extends StatelessWidget {
  final Widget Function(T1, T2, T3) builder;

  const DependentWidget3({
    Key? key,
    required this.builder
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final container = Provider.of<DiContainer>(context);

    return builder(
      container.resolve<T1>(),
      container.resolve<T2>(),
      container.resolve<T3>(),
    );
  }
}

class DependentWidget4<T1, T2, T3, T4> extends StatelessWidget {
  final Widget Function(T1, T2, T3, T4) builder;

  const DependentWidget4({
    Key? key,
    required this.builder
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final container = Provider.of<DiContainer>(context);

    return builder(
      container.resolve<T1>(),
      container.resolve<T2>(),
      container.resolve<T3>(),
      container.resolve<T4>(),
    );
  }
}

class DependentWidget5<T1, T2, T3, T4, T5> extends StatelessWidget {
  final Widget Function(T1, T2, T3, T4, T5) builder;

  const DependentWidget5({
    Key? key,
    required this.builder
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final container = Provider.of<DiContainer>(context);

    return builder(
      container.resolve<T1>(),
      container.resolve<T2>(),
      container.resolve<T3>(),
      container.resolve<T4>(),
      container.resolve<T5>(),
    );
  }
}

class DependentWidget6<T1, T2, T3, T4, T5, T6> extends StatelessWidget {
  final Widget Function(T1, T2, T3, T4, T5, T6) builder;

  const DependentWidget6({
    Key? key,
    required this.builder
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final container = Provider.of<DiContainer>(context);

    return builder(
      container.resolve<T1>(),
      container.resolve<T2>(),
      container.resolve<T3>(),
      container.resolve<T4>(),
      container.resolve<T5>(),
      container.resolve<T6>(),
    );
  }
}

class DependentWidget7<T1, T2, T3, T4, T5, T6, T7> extends StatelessWidget {
  final Widget Function(T1, T2, T3, T4, T5, T6, T7) builder;

  const DependentWidget7({
    Key? key,
    required this.builder
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final container = Provider.of<DiContainer>(context);

    return builder(
      container.resolve<T1>(),
      container.resolve<T2>(),
      container.resolve<T3>(),
      container.resolve<T4>(),
      container.resolve<T5>(),
      container.resolve<T6>(),
      container.resolve<T7>(),
    );
  }
}

class DependentWidget8<T1, T2, T3, T4, T5, T6, T7, T8> extends StatelessWidget {
  final Widget Function(T1, T2, T3, T4, T5, T6, T7, T8) builder;

  const DependentWidget8({
    Key? key,
    required this.builder
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final container = Provider.of<DiContainer>(context);

    return builder(
      container.resolve<T1>(),
      container.resolve<T2>(),
      container.resolve<T3>(),
      container.resolve<T4>(),
      container.resolve<T5>(),
      container.resolve<T6>(),
      container.resolve<T7>(),
      container.resolve<T8>(),
    );
  }
}