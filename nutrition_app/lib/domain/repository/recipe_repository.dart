import 'package:nutrition_app/core/resources/data_state.dart';
import 'package:nutrition_app/domain/entities/recipe_entity.dart';

abstract class RecipeRepository {
  Future<DataState<List<RecipeEntity>>> getRandomRecipies(int ammount);
}
