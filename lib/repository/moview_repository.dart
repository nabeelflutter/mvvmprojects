// ignore_for_file: use_rethrow_when_possible

import 'package:mvvmpattern/modal/moviesmodel.dart';

import '../data/network/baseapiservices.dart';
import '../data/network/networkapiservices.dart';
import '../res/appurl.dart';

class MoviesRepository{
  final BaseApiAServices _baseApiAServices = NetworkApiServices();
  Future<MoviesModel> getApi() async{
    try{
      dynamic responce = await _baseApiAServices.getGetApiResponse(AppUlr.getUrl);
      return responce = MoviesModel.fromJson(responce);
    }catch(e){
      throw e;
    }
  }
}