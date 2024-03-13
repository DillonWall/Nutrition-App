import 'package:nutrition_app/domain/entities/recipe_entity.dart';

class RecipeResponseModel {
  RecipeModel? recipe;

  RecipeResponseModel({required this.recipe});

  factory RecipeResponseModel.fromJson(Map<String, dynamic> recipeResponseData) {
    List<dynamic>? dataList = recipeResponseData['meals'];
    if (dataList == null || dataList.isEmpty) return RecipeResponseModel(recipe: null);

    return RecipeResponseModel(
      recipe: RecipeModel.fromJson(
        dataList[0], // Get the first element (the API returns an array of only one meal)
      ),
    );
  }
}

class RecipeModel extends RecipeEntity {
  const RecipeModel({
    super.id,
    super.name,
    super.category,
    super.area,
    super.instructions,
    super.thumbnailUrl,
    super.tags,
    super.youtubeUrl,
    super.ingredients,
    super.measurements,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> map) {
    RecipeModel ret = RecipeModel(
      id: int.tryParse(map["idMeal"]) ?? -1,
      name: map["strMeal"] ?? "",
      category: map["strCategory"] ?? "",
      area: map["strArea"] ?? "",
      instructions: map["strInstructions"] ?? "",
      thumbnailUrl: map["strMealThumb"] ?? "",
      tags: map["strTags"] ?? "",
      youtubeUrl: map["strYoutube"] ?? "",
      ingredients: [
        map["strIngredient1"] ?? "",
        map["strIngredient2"] ?? "",
        map["strIngredient3"] ?? "",
        map["strIngredient4"] ?? "",
        map["strIngredient5"] ?? "",
        map["strIngredient6"] ?? "",
        map["strIngredient7"] ?? "",
        map["strIngredient8"] ?? "",
        map["strIngredient9"] ?? "",
        map["strIngredient10"] ?? "",
        map["strIngredient11"] ?? "",
        map["strIngredient12"] ?? "",
        map["strIngredient13"] ?? "",
        map["strIngredient14"] ?? "",
        map["strIngredient15"] ?? "",
        map["strIngredient16"] ?? "",
        map["strIngredient17"] ?? "",
        map["strIngredient18"] ?? "",
        map["strIngredient19"] ?? "",
        map["strIngredient20"] ?? "",
      ],
      measurements: [
        map["strMeasure1"] ?? "",
        map["strMeasure2"] ?? "",
        map["strMeasure3"] ?? "",
        map["strMeasure4"] ?? "",
        map["strMeasure5"] ?? "",
        map["strMeasure6"] ?? "",
        map["strMeasure7"] ?? "",
        map["strMeasure8"] ?? "",
        map["strMeasure9"] ?? "",
        map["strMeasure10"] ?? "",
        map["strMeasure11"] ?? "",
        map["strMeasure12"] ?? "",
        map["strMeasure13"] ?? "",
        map["strMeasure14"] ?? "",
        map["strMeasure15"] ?? "",
        map["strMeasure16"] ?? "",
        map["strMeasure17"] ?? "",
        map["strMeasure18"] ?? "",
        map["strMeasure19"] ?? "",
        map["strMeasure20"] ?? "",
      ],
    );
    return ret;
  }
}
