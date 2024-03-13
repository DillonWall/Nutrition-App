import 'package:nutrition_app/core/resources/data_state.dart';
import 'package:nutrition_app/core/resources/use_case.dart';
import 'package:nutrition_app/domain/entities/recipe_entity.dart';
import 'package:nutrition_app/domain/repository/recipe_repository.dart';

class GetRandomRecipesUseCase implements UseCase<DataState<List<RecipeEntity>>, int> {
  final RecipeRepository _recipeRepository;

  GetRandomRecipesUseCase(this._recipeRepository);

  @override
  Future<DataState<List<RecipeEntity>>> call({int params = 10}) {
    return _recipeRepository.getRandomRecipes(params);
  }
}
