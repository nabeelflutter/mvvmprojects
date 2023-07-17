import 'package:flutter/cupertino.dart';
import 'package:mvvmpattern/data/response/api_response.dart';

import '../modal/moviesmodel.dart';
import '../repository/moview_repository.dart';

class MoviesViewModel with ChangeNotifier{

   final _myRepo = MoviesRepository();
   ApiResponse<MoviesModel> moviesList = ApiResponse.loading();
   setMoviesList(ApiResponse<MoviesModel> response){
               moviesList = response;
               notifyListeners();
   }
   Future<void> getMoviesList() async{
     setMoviesList(ApiResponse.loading());
     _myRepo.getApi().then((value) {
       setMoviesList(ApiResponse.completed(value));
     }).onError((error, stackTrace) {
       setMoviesList(ApiResponse.error(error.toString()));
     }
     );
   }
}