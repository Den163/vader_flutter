import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:vader_flutter/vader_flutter.dart';

class InjectableWidget<TDependency extends Widget> extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final diModule = Provider.of<DiModule>(context);
    return diModule.resolve<TDependency>();
  }

}