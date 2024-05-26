import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable {
  final DioException? error;

  const BaseState({this.error});

  @override
  List<Object> get props => [error!];
}

// final class BaseStateError extends BaseState {
//   const BaseStateError(DioException error) : super(error: error);
// }
