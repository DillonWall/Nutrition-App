import 'package:nutrition_app/core/resources/data_state.dart';
import 'package:nutrition_app/core/resources/use_case.dart';
import 'package:nutrition_app/domain/entities/category_entity.dart';
import 'package:nutrition_app/domain/repository/category_repository.dart';

class GetCategoriesUseCase implements UseCase<DataState<List<CategoryEntity>>, void> {
  final CategoryRepository _categoryRepository;

  GetCategoriesUseCase(this._categoryRepository);

  @override
  Future<DataState<List<CategoryEntity>>> call({void params}) {
    return _categoryRepository.getCategories();
  }
}
