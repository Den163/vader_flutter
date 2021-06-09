import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vader_di/vader.dart';
import 'package:meta/meta.dart';

abstract class ModuleInjector extends StatelessWidget {
  Widget get child;
  void configure(DiContainer module);

  ModuleInjector({Key? key}) : super(key: key);

  @override
  @nonVirtual
  Widget build(BuildContext context) {
    return Provider<DiContainer>(
      create: (_) {
        final parentContainer = _tryGetParentContainer(context);
        final diContainer = new DiContainer(parentContainer);
        final module = new DiContainer(diContainer);
        configure(module);
        return module;
      },
      dispose: (context, module) => module.dispose(),
      child: child,
    );
  }

  DiContainer? _tryGetParentContainer(BuildContext context) {
    try {
      return Provider.of<DiContainer>(context);
    } catch (e) {
      return null;
    }
  }
}
