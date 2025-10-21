import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_recipe_app/Data/Repositories/image_fetcher_repository.dart';

part 'fetch_image_state.dart';

class FetchImageCubit extends Cubit<FetchImageState> {
  final ImageFetcherRepository imageFetcherRepository;
  FetchImageCubit({required this.imageFetcherRepository})
    : super(FetchImageInitial());
  Future<void> fetchImage(String itemName) async {
    emit(FetchImageLoading());
    try {
      final imageData = await imageFetcherRepository.getImageData(itemName);

      if (imageData['hits'] != null && (imageData['hits'] as List).isNotEmpty) {
        final imageUrl = (imageData['hits'] as List)[0]['webformatURL'] as String;
        emit(FetchImageSuccess(imageUrl));
      } else {
        emit(FetchImageSuccess('')); // Emit success with empty URL if no hits
      }
    } catch (e) {
      emit(FetchImageFailure(e.toString()));
    }
  }
}
