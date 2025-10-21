part of 'fetch_image_cubit.dart';

@immutable
sealed class FetchImageState {}

final class FetchImageInitial extends FetchImageState {}

final class FetchImageLoading extends FetchImageState {}

final class FetchImageSuccess extends FetchImageState {
  final String imageUrl;
  FetchImageSuccess(this.imageUrl);
}

final class FetchImageFailure extends FetchImageState {
  final String error;
  FetchImageFailure(this.error);
}
