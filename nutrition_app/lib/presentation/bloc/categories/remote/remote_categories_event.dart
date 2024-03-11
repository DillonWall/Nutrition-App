part of 'remote_categories_bloc.dart';

sealed class RemoteCategoriesEvent extends Equatable {
  const RemoteCategoriesEvent();

  @override
  List<Object> get props => [];
}

final class GetCategories extends RemoteCategoriesEvent {
  const GetCategories();
}
