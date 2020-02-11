import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:vader_flutter/vader_flutter.dart';

class InjectableWidget<TDependency extends Widget> extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final container = Provider.of<DiContainer>(context);
    return container.resolve<TDependency>();
  }

}