import 'package:nutrition_app/core/resources/data_state.dart';
import 'package:nutrition_app/domain/entities/recipe_entity.dart';
import 'package:nutrition_app/domain/repository/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  @override
  Future<DataState<List<RecipeEntity>>> getRandomRecipies(int ammount) {
    // TODO: implement getRandomRecipies
    throw UnimplementedError();
  }
}
