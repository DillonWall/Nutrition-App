import 'package:nutrition_app/core/resources/data_state.dart';
import 'package:nutrition_app/domain/entities/category_entity.dart';

abstract class CategoryRepository {
  Future<DataState<List<CategoryEntity>>> getCategories();
}
