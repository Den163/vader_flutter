import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vader_di/vader.dart';
import 'package:meta/meta.dart';

abstract class ModuleInjector extends StatefulWidget {
  ModuleInjector({Key key}) : super(key: key);

  void configure(DiModule module);
  Widget build(BuildContext context);


  /// Note. Don't override this
  // TODO When package will be updated to Flutter 1.1.12.xx
  // add [@nonVirtual] modifier 
  @override
  _ModuleInjectorState createState() => _ModuleInjectorState();
}

@sealed
class _ModuleInjectorState extends State<ModuleInjector> {
  DiModule _parentModule;
  DiModule _module;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    DiModule parentModule;

    try {
      parentModule = Provider.of(context);
    } on ProviderNotFoundError {
      parentModule = null;
    }

    if (parentModule != _parentModule || _module == null) {
      _module?.dispose();

      _module = new DiModule(parentModule?.container);
      widget.configure(_module);
    }
  }

  @override
  void dispose() {
    _module.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: _module,
      child: widget.build(context),
    );
  }
}