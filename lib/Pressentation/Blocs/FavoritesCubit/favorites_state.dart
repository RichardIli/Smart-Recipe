part of 'favorites_cubit.dart';

@immutable
sealed class FavoritesState {}

final class FavoritesListState extends FavoritesState {
  final List<Recipe> recipes;
  FavoritesListState({required this.recipes});
}
