import 'package:nutrition_app/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    int? id,
    String? name,
    String? thumbnailUrl,
    String? description,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> map) {
    return CategoryModel(
      id: map["idCategory"] ?? "",
      name: map["strCategory"] ?? "",
      thumbnailUrl: map["strCategoryThumb"] ?? "",
      description: map["strCategoryDescription"] ?? "",
    );
  }
}
