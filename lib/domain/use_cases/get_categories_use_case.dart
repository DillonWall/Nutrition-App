import 'package:nutrition_app/core/resources/data_state.dart';
import 'package:nutrition_app/core/resources/use_case.dart';
import 'package:nutrition_app/domain/entities/category_entity.dart';
import 'package:nutrition_app/domain/repository/category_repository.dart';

typedef GetCategoriesUseCaseDataType = DataState<List<CategoryEntity>>;

class GetCategoriesUseCase extends UseCase<GetCategoriesUseCaseDataType, void> {
  final CategoryRepository _categoryRepository;

  GetCategoriesUseCase(this._categoryRepository);

  @override
  Future<GetCategoriesUseCaseDataType> call({void params}) {
    return _categoryRepository.getCategories();
  }
}
