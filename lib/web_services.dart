import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterapp/constants.dart';
import 'package:flutterapp/models/weather_data_model.dart';

import 'models/weather_location_model.dart';

class WebServices {
  WebServices._() {}

  Future<WeatherDataModel> fetchWeather({@required int locationId}) async {
    Dio dio = getDioBaseConfiguration();
    Response response = await dio.get("api/location/$locationId");
    WeatherDataModel weatherDataModel =
        WeatherDataModel.fromJson(response.data as Map<String, dynamic>);
    print(response);
    return weatherDataModel;
  }

  Future<int> getLocationId({@required String cityName}) async {
    Dio dio = getDioBaseConfiguration();
    Response response = await dio.get("api/location/search/?query=$cityName");
    List<WeatherLocationModel> weatherLocationList =
        (response.data as List<dynamic>)
            .map((singleModel) => WeatherLocationModel.fromJson(singleModel))
            .toList();
    return weatherLocationList.length > 0 ? weatherLocationList[0].woeid : -1;
  }

  factory WebServices.initial() {
    return WebServices._();
  }

  Dio getDioBaseConfiguration() {
    BaseOptions options = BaseOptions(
        baseUrl: Constants.BASE_URL,
        responseType: ResponseType.json,
        connectTimeout: 5000);
    return Dio(options);
  }
}
