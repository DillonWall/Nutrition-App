part of 'remote_random_recipes_bloc.dart';

sealed class RemoteRandomRecipesState extends Equatable {
  final List<RecipeEntity>? recipes;
  final DioException? error;

  const RemoteRandomRecipesState({this.recipes, this.error});

  @override
  List<Object> get props => [recipes!, error!];
}

final class RemoteRandomRecipesLoading extends RemoteRandomRecipesState {
  const RemoteRandomRecipesLoading();
}

final class RemoteRandomRecipesDone extends RemoteRandomRecipesState {
  const RemoteRandomRecipesDone(List<RecipeEntity> recipes) : super(recipes: recipes);
}

final class RemoteRandomRecipesError extends RemoteRandomRecipesState {
  const RemoteRandomRecipesError(DioException error) : super(error: error);
}
