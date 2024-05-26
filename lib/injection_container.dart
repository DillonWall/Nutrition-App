import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nutrition_app/config/theme/theme_collection.dart';
import 'package:nutrition_app/config/theme/theme_cubit.dart';
import 'package:nutrition_app/data/data_sources/remote/meal_api_service.dart';
import 'package:nutrition_app/data/repository_implementations/category_repository_impl.dart';
import 'package:nutrition_app/data/repository_implementations/recipe_repository_impl.dart';
import 'package:nutrition_app/domain/repository/category_repository.dart';
import 'package:nutrition_app/domain/repository/recipe_repository.dart';
import 'package:nutrition_app/domain/use_cases/get_categories_use_case.dart';
import 'package:nutrition_app/domain/use_cases/get_random_recipes_use_case.dart';
import 'package:nutrition_app/presentation/bloc/loading/loading_bloc.dart';

// Service Locator (for Dependency Injection)
final sl = GetIt.instance;
List<BlocProvider> blocProviders = [];

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

  // State Management (Blocs, Cubits)
  sl.registerFactory<LoadingBloc<GetCategoriesUseCase>>(() => LoadingBloc(sl()));
  blocProviders.add(BlocProvider<LoadingBloc<GetCategoriesUseCase>>(
    create: (context) => sl()..add(const InitLoadEvent()),
  ));

  sl.registerFactory<LoadingBloc<GetRandomRecipesUseCase>>(() => LoadingBloc(sl()));
  blocProviders.add(BlocProvider<LoadingBloc<GetRandomRecipesUseCase>>(
    create: (context) => sl()..add(const InitLoadEvent(params: 10)),
  ));

  sl.registerFactory<ThemeCubit>(() => ThemeCubit(ThemeCollection.lightTheme));
  blocProviders.add(BlocProvider<ThemeCubit>(
    create: (context) => sl(),
  ));
}
