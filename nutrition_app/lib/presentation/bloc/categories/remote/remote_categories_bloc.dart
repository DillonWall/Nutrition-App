import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:nutrition_app/core/resources/data_state.dart';
import 'package:nutrition_app/domain/entities/category_entity.dart';
import 'package:nutrition_app/domain/use_cases/get_categories_use_case.dart';

part 'remote_categories_event.dart';
part 'remote_categories_state.dart';

class RemoteCategoriesBloc extends Bloc<RemoteCategoriesEvent, RemoteCategoriesState> {
  final GetCategoriesUseCase _getCategoriesUseCase;

  RemoteCategoriesBloc(this._getCategoriesUseCase) : super(const RemoteCategoriesLoading()) {
    on<GetCategories>(onGetCategories);
  }

  void onGetCategories(GetCategories event, Emitter<RemoteCategoriesState> emit) async {
    final dataState = await _getCategoriesUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteCategoriesDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RemoteCategoriesError(dataState.error!));
    }
  }
}
