import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:nutrition_app/core/resources/data_state.dart';
import 'package:nutrition_app/domain/entities/recipe_entity.dart';
import 'package:nutrition_app/domain/use_cases/get_random_recipes_use_case.dart';

part 'remote_random_recipes_event.dart';
part 'remote_random_recipes_state.dart';

class RemoteRandomRecipesBloc extends Bloc<RemoteRandomRecipesEvent, RemoteRandomRecipesState> {
  final GetRandomRecipesUseCase _getRandomRecipesUseCase;

  RemoteRandomRecipesBloc(this._getRandomRecipesUseCase)
      : super(const RemoteRandomRecipesLoading()) {
    on<GetRandomRecipes>(onGetRandomRecipes);
  }

  Future<void> onGetRandomRecipes(
      GetRandomRecipes event, Emitter<RemoteRandomRecipesState> emit) async {
    final dataState = await _getRandomRecipesUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteRandomRecipesDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RemoteRandomRecipesError(dataState.error!));
    }
  }
}
