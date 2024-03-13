import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nutrition_app/data/data_sources/remote/meal_api_service.dart';
import 'package:nutrition_app/data/repository_implementations/category_repository_impl.dart';
import 'package:nutrition_app/data/repository_implementations/recipe_repository_impl.dart';
import 'package:nutrition_app/domain/repository/category_repository.dart';
import 'package:nutrition_app/domain/repository/recipe_repository.dart';
import 'package:nutrition_app/domain/use_cases/get_categories_use_case.dart';
import 'package:nutrition_app/domain/use_cases/get_random_recipes_use_case.dart';
import 'package:nutrition_app/presentation/bloc/categories/remote/remote_categories_bloc.dart';
import 'package:nutrition_app/presentation/bloc/random_recipes/remote/remote_random_recipes_bloc.dart';

// Service Locator (for Dependency Injection)
final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<MealApiService>(MealApiService(sl()));
  sl.registerSingleton<CategoryRepository>(CategoryRepositoryImpl(sl()));
  sl.registerSingleton<RecipeRepository>(RecipeRepositoryImpl(sl()));

  // Use Cases
  sl.registerSingleton<GetCategoriesUseCase>(GetCategoriesUseCase(sl()));
  sl.registerSingleton<GetRandomRecipesUseCase>(GetRandomRecipesUseCase(sl()));

  // Blocs
  sl.registerFactory<RemoteCategoriesBloc>(() => RemoteCategoriesBloc(sl()));
  sl.registerFactory<RemoteRandomRecipesBloc>(() => RemoteRandomRecipesBloc(sl()));
}
