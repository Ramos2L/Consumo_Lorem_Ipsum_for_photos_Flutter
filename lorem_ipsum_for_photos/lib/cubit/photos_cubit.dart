import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:dio/dio.dart';
import 'dart:math';

part 'photos_state.dart';

class PhotosCubit extends Cubit<PhotosState> {
  PhotosCubit() : super(PhotosInitial());

  Future<void> photosRandom() async {
    try {
      final response = await Dio().get('https://picsum.photos/v2/list');
      var intValue = Random().nextInt(response.data.length);
      emit(PhotosSucess(response.data[intValue]['download_url']));
    } catch (e) {
      emit(PhotosError('Erro ao gerar foto... Por favor, tente novamente...'));
    } 
  }
}
