import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/core/resources/use_case.dart';
import 'package:nutrition_app/presentation/bloc/loading/loading_bloc.dart';

class LoadingIndicator<UseCaseType extends UseCase> extends StatelessWidget {
  final Widget Function(LoadingState state) onLoadCreateWidget;

  const LoadingIndicator({super.key, required this.onLoadCreateWidget});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadingBloc<UseCaseType>, LoadingState>(
      builder: (_, state) {
        if (state is LoadingStateLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is LoadingStateError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is LoadingStateDone) {
          return onLoadCreateWidget(state);
        }
        return Container();
      },
    );
  }
}
