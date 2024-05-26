part of 'loading_bloc.dart';

sealed class LoadingEvent extends Equatable {
  const LoadingEvent();

  @override
  List<Object> get props => [];
}

final class InitLoadEvent<Params> extends LoadingEvent {
  final Params? params;
  const InitLoadEvent({this.params});
}
