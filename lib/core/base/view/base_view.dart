// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class BaseView<T extends Store> extends StatefulWidget {
  const BaseView({
    Key? key,
    required this.viewModel,
    required this.onModelReady,
    required this.onPageBuilder,
    this.onDispose,
  }) : super(key: key);

  final T viewModel;
  final Function(T model) onModelReady;
  final Widget Function(BuildContext context, T model) onPageBuilder;
  final VoidCallback? onDispose;

  @override
  // ignore: library_private_types_in_public_api
  _BaseViewState<T> createState() => _BaseViewState();
}

class _BaseViewState<T extends Store> extends State<BaseView<T>> {
  @override
  void initState() {
    super.initState();
    widget.onModelReady(widget.viewModel);
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onDispose != null) widget.onDispose!();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context, widget.viewModel);
  }
}
