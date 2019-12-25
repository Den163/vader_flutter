# vader_flutter

A Flutter implementation of the Vader package

## Getting Started

This is a Flutter package with helper classes to more convenient integration with
[Vader](https://github.com/Den163/vader) - runtime dependency injection library for Dart.

It's wrap around [Provider package](https://github.com/rrousselGit/provider). And provides 
```ModuleInjector``` and ```DependentWidget``` Widgets to manage your project dependencies.

And you can ask <b>Why not just using a [Provider?](https://github.com/rrousselGit/provider)</b>
The first, Provider is a great package for maintain reactive interactions between different widgets.
And I strongly recommend using it for that purpose. 
But using it just for a Dependency Injection pattern is resulting in writing too much code,
because of Widget nature of Provider. So in my projects I need a fast and convenient way to
define a lot of services, repositories, BloCs(Business Logic Components), etc 'static components'
to receive it from any point of a Flutter app. 
Note, that [Vader](https://pub.dev/packages/vader_di) not listening on all dependencies like 
a [Provider](https://github.com/rrousselGit/provider). And it's use case just to define and pass
static 'business logic' dependencies. It's only listening on ``DiModule`` 
and rebuilds `ModuleInjector`'s subtree only if the parent `DiModule` changes,
because it passes through app via a [Provider](https://github.com/rrousselGit/provider).

## Basic Usage

A ``ModuleInjector`` is just a Widget wrapper around a ```DiModule``` vader class. 
It is an abstract, so you need to subclass it to override a ```configure(DiModule)``` 
```build(BuildContext)``` methods. The first one is just defines dependencies via ```DiModule``` 
([see Vader](https://pub.dev/packages/vader_di)) for the subtree building from 
```build(BuildContext)``` method.

A ```DependentWidget``` is just a receiver of your dependencies, 
defined in the ```ModuleInjector```. So in the ```builder``` parameter you need to pass
a factory function that builds a child widget with this dependencies. It's very similar to
Provider's ```Consumer``` widget but without any context or other widget parameters to avoid
boilerplate code with ```_``` and ```__``` arguments.

A ```NavigatorModule``` widget adds convenient and flexible way to create a nested ```Navigator``` with it's own context. You can combine
it with ```ModuleInjector``` and get independent module with it's own dependencies. Note that if you want to use a ```Hero``` you in the nested ```Navigator``` - you need to add a ```HeroController``` to 
observers parameter in ```Navigator``` or ```NavigatorModule```.

Tired of a boring builder and factory writings for Widgets? Look at ```InjectableWidget<T>```.
It just resolves and builds as child configured earlier ```Widget``` of type ```T```

## Example

```dart
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
  Widget build(BuildContext context) {
    return child;
  }

  @override
  void configure(DiModule module) {
    module.bind<T>().toValue(valueToResolve);
  }
}
```
