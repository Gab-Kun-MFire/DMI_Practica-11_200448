import 'dart:async';
import 'package:dmi_practica10_200448/model/Media.dart';
import 'package:dmi_practica10_200448/common/HttpHandler.dart';

abstract class MediaProvider{
  
  Future<List<Media>> fetchMedia();
}

class MediaPrvider extends MediaProvider{
HttpHandler _client = HttpHandler.get();
@override
Future<List<Media>> fetchMedia(){
  return _client.fetchMovies();
}
}

class ShowProvider extends MediaProvider{
HttpHandler _client = HttpHandler.get();
@override
Future<List<Media>> fetchMedia(){
  return _client.fetchShow();
}
}