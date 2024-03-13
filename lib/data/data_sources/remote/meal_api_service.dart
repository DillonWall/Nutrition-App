import 'package:dio/dio.dart';
import 'package:nutrition_app/core/constants/constants.dart';
import 'package:nutrition_app/data/models/category_model.dart';
import 'package:nutrition_app/data/models/recipe_model.dart';
import 'package:retrofit/retrofit.dart';

part 'meal_api_service.g.dart';

@RestApi(baseUrl: mealAPIBaseURL)
abstract class MealApiService {
  factory MealApiService(Dio dio) = _MealApiService;

  @GET('/random.php')
  Future<HttpResponse<RecipeResponseModel>> getRandomRecipe();

  @GET('/categories.php')
  Future<HttpResponse<CategoryResponseModel>> getCategories();
}
