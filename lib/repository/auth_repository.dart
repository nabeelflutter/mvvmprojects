// ignore_for_file: use_rethrow_when_possible

import 'package:mvvmpattern/data/network/baseapiservices.dart';
import 'package:mvvmpattern/res/appurl.dart';

import '../data/network/networkapiservices.dart';

class AuthRepository {
  final BaseApiAServices _baseApiAServices = NetworkApiServices();
  Future<dynamic> loginApi(dynamic data) async{
    try{
      dynamic responce = await _baseApiAServices.getPostApiResponse(AppUlr.loginUrl, data);
      return responce;
    }catch(e){
      throw e;
    }
  }
  Future<dynamic> registerApi(dynamic data) async{
    try{
      dynamic responce = await _baseApiAServices.getPostApiResponse(AppUlr.registerUrl, data);
      return responce;
    }catch(e){
      throw e;
    }
  }
}