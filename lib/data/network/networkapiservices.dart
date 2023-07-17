// ignore_for_file: prefer_adjacent_string_concatenation

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:mvvmpattern/data/app_exception.dart';
import 'package:mvvmpattern/data/network/baseapiservices.dart';

class NetworkApiServices extends BaseApiAServices{
  @override
  Future getGetApiResponse(String url) async{
    dynamic responseJson;
    try{
        final response = await get(Uri.parse(url)).timeout(const Duration(seconds: 10));
        responseJson =  responseRequest(response);
    } on SocketException{
      throw FetchDataException('No Internet Exception');
    }
    return responseJson;

  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try{
      final response = await post(Uri.parse(url),body:data).timeout(const Duration(seconds: 10));
      responseJson =  responseRequest(response);
    } on SocketException{
      throw FetchDataException('No Internet Exception');
    }
    return responseJson;
  }
  dynamic responseRequest(Response response){
    switch(response.statusCode){
      case 200 : dynamic responseJson = jsonDecode(response.body);
      return responseJson;
      case 400 : throw BadRequestException(response.body.toString());
      case 404 : throw UnAuthorizedException(response.body.toString());

      default: throw FetchDataException('Error occurred while communication with server' + 'with status code' + response.statusCode.toString());
    }
  }

}