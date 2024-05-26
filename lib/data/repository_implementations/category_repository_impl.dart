import 'dart:io';

import 'package:dio/dio.dart';
import 'package:nutrition_app/core/resources/data_state.dart';
import 'package:nutrition_app/data/data_sources/remote/meal_api_service.dart';
import 'package:nutrition_app/domain/entities/category_entity.dart';
import 'package:nutrition_app/domain/repository/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final MealApiService _mealApiService;
  CategoryRepositoryImpl(this._mealApiService);

  @override
  Future<DataState<List<CategoryEntity>>> getCategories() async {
    try {
      final httpResponse = await _mealApiService.getCategories();

      if (httpResponse.response.statusCode == HttpStatus.ok &&
          httpResponse.data.categories.isNotEmpty) {
        return DataSuccess(httpResponse.data.categories);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
