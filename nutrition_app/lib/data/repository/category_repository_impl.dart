import 'package:nutrition_app/core/resources/data_state.dart';
import 'package:nutrition_app/domain/entities/category_entity.dart';
import 'package:nutrition_app/domain/repository/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  @override
  Future<DataState<List<CategoryEntity>>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }
}
