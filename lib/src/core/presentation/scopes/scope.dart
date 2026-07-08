import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

typedef DelegateAccess<D extends ScopeDelegate> =
    D Function(BuildContext context, {bool listen});

/// Base for stateful InheritedWidget-backed scopes.
///
/// Subclass [Scope] and provide a [ScopeDelegate] via [createDelegate].
abstract class Scope extends StatefulWidget {
  const Scope({required this._child, super.key});
  final Widget _child;

  static D delegateOf<S extends Scope, D extends ScopeDelegate<S>>(
    BuildContext context, {
    bool listen = false,
  }) {
    final scope = listen
        ? context.dependOnInheritedWidgetOfExactType<_InheritedScope<S>>()
        : context
                  .getElementForInheritedWidgetOfExactType<_InheritedScope<S>>()
                  ?.widget
              as _InheritedScope<S>?;
    assert(
      scope != null,
      'Unable to locate $D of $S. Either it was not declared as an ancestor '
      'of the widget that has tried to access it, or BuildContext does not '
      'contain its instance.',
    );

    // ignore: cast_nullable_to_non_nullable
    return scope?.delegate as D;
  }

  ScopeDelegate<Scope> createDelegate();

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => createDelegate();
}

abstract class ScopeDelegate<S extends Scope> extends State<S> {
  List<Object?> get _keys => const [];

  @override
  @nonVirtual
  Widget build(BuildContext context) =>
      _InheritedScope<S>(delegate: this, child: widget._child);
}

class _InheritedScope<S extends Scope> extends InheritedWidget {
  _InheritedScope({required this.delegate, required super.child, super.key})
    : keys = delegate._keys;
  final List<Object?> keys;
  final ScopeDelegate<Scope> delegate;

  @override
  bool updateShouldNotify(_InheritedScope<S> oldWidget) =>
      !const DeepCollectionEquality().equals(keys, oldWidget.keys);
}
