import 'package:nutrition_app/domain/entities/category_entity.dart';

class CategoryResponseModel {
  List<CategoryModel> categories;

  CategoryResponseModel({required this.categories});

  factory CategoryResponseModel.fromJson(Map<String, dynamic> categoryResponseData) {
    return CategoryResponseModel(
        categories: ((categoryResponseData['categories'] ?? []) as List<dynamic>)
            .map((dynamic category) => CategoryModel.fromJson(category))
            .toList());
  }
}

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    int? id,
    String? name,
    String? thumbnailUrl,
    String? description,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> map) {
    return CategoryModel(
      id: int.tryParse(map["idCategory"]) ?? -1,
      name: map["strCategory"] ?? "",
      thumbnailUrl: map["strCategoryThumb"] ?? "",
      description: map["strCategoryDescription"] ?? "",
    );
  }
}
