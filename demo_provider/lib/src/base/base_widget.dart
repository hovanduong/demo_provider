import 'package:demo_provider/src/base/base_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseWidget<T extends BaseViewModel> extends StatefulWidget {
  final Widget? child;
  final Widget Function(BuildContext context, T viewmodel, Widget? child)
      builder;
  final T viewModel;
  final Function(T? viewModel)? onViewModelReady;
  const BaseWidget(
      {Key? key,
      required this.builder,
      required this.viewModel,
      this.child,
      this.onViewModelReady}) : super(key: key);
  @override
  _BaseWidgetState<T> createState() => _BaseWidgetState<T>();
}

class _BaseWidgetState<T extends BaseViewModel> extends State<BaseWidget<T>> {
  T? viewModel;
  @override
  void initState() {
    viewModel = widget.viewModel;
    if (widget.onViewModelReady != null) {
      widget.onViewModelReady!(viewModel);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => viewModel!..setContext(context),
      child: Consumer<T>(builder: widget.builder),
    );
  }
}
