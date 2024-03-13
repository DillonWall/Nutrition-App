part of 'remote_categories_bloc.dart';

sealed class RemoteCategoriesState extends Equatable {
  final List<CategoryEntity>? categories;
  final DioException? error;

  const RemoteCategoriesState({this.categories, this.error});

  @override
  List<Object> get props => [categories!, error!];
}

final class RemoteCategoriesLoading extends RemoteCategoriesState {
  const RemoteCategoriesLoading();
}

final class RemoteCategoriesDone extends RemoteCategoriesState {
  const RemoteCategoriesDone(List<CategoryEntity> categories) : super(categories: categories);
}

final class RemoteCategoriesError extends RemoteCategoriesState {
  const RemoteCategoriesError(DioException error) : super(error: error);
}
