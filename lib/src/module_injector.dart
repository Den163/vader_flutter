import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vader_di/vader.dart';

abstract class ModuleInjector extends StatelessWidget {
  Widget get child;
  void configure(DiModule module);

  ModuleInjector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<DiModule>(
      create: (_) {
        final parentContainer = _tryGetParentContainer(context);
        final diContainer = new DiContainer(parentContainer);
        final module = new DiModule(diContainer);
        configure(module);
        return module;
      },
      dispose: (context, module) => module.dispose(),
      child: child,
    );
  }

  DiContainer _tryGetParentContainer(BuildContext context) {
    try {
      return Provider.of<DiModule>(context).container;
    } catch (e) {
      return null;
    }
  }
}
