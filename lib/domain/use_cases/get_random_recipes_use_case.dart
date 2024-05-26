import 'package:nutrition_app/core/resources/data_state.dart';
import 'package:nutrition_app/core/resources/use_case.dart';
import 'package:nutrition_app/domain/entities/recipe_entity.dart';
import 'package:nutrition_app/domain/repository/recipe_repository.dart';

typedef GetRandomRecipesUseCaseDataType = DataState<List<RecipeEntity>>;

class GetRandomRecipesUseCase extends UseCase<GetRandomRecipesUseCaseDataType, int> {
  final RecipeRepository _recipeRepository;

  GetRandomRecipesUseCase(this._recipeRepository);

  @override
  Future<GetRandomRecipesUseCaseDataType> call({int params = 10}) {
    return _recipeRepository.getRandomRecipes(params);
  }
}
