part of 'remote_random_recipes_bloc.dart';

sealed class RemoteRandomRecipesEvent extends Equatable {
  const RemoteRandomRecipesEvent();

  @override
  List<Object> get props => [];
}

final class GetRandomRecipes extends RemoteRandomRecipesEvent {
  final int? amount;
  const GetRandomRecipes(this.amount);
}
