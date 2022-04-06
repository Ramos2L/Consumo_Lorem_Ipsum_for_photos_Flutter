part of 'photos_cubit.dart';

@immutable
abstract class PhotosState {}

class PhotosInitial extends PhotosState {
  PhotosInitial();
}

class PhotosSucess implements PhotosState {
  var data = '';

  PhotosSucess(this.data);
} 

class PhotosError implements PhotosState {
  final String message;

  PhotosError(this.message);
}

class PhotosLoaded implements PhotosState {
  PhotosLoaded();
}
