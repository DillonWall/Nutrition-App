import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:nutrition_app/core/resources/bloc/base_state.dart';
import 'package:nutrition_app/core/resources/data_state.dart';
import 'package:nutrition_app/core/resources/use_case.dart';

part 'loading_event.dart';
part 'loading_state.dart';

class LoadingBloc<UseCaseType extends UseCase> extends Bloc<LoadingEvent, LoadingState> {
  final UseCaseType _useCase;

  LoadingBloc(this._useCase) : super(const LoadingStateLoading()) {
    on<InitLoadEvent>(onInitLoadEvent);
  }

  Future<void> onInitLoadEvent(InitLoadEvent event, Emitter<LoadingState> emit) async {
    final dataState = await _useCase(params: event.params);

    if (dataState is DataSuccess) {
      emit(LoadingStateDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(LoadingStateError(dataState.error!));
    }
  }
}
