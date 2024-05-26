part of 'loading_bloc.dart';

sealed class LoadingState extends BaseState {
  final dynamic data;

  const LoadingState({super.error, this.data});

  @override
  List<Object> get props => [error!, data!];
}

final class LoadingStateLoading extends LoadingState {
  const LoadingStateLoading();
}

final class LoadingStateDone extends LoadingState {
  const LoadingStateDone(dynamic data) : super(data: data);
}

final class LoadingStateError extends LoadingState {
  const LoadingStateError(DioException error) : super(error: error);
}
