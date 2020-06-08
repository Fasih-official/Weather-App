import 'package:flutterapp/models/weather_data_model.dart';
import 'package:flutterapp/web_services.dart';

class WeatherRepository {
  WebServices _webServices;

  WeatherRepository(this._webServices);

  Future<WeatherDataModel> getWeather(String city) async {
    final int locationId = await _webServices.getLocationId(cityName: city);
    if (locationId > -1) {
      return await _webServices.fetchWeather(locationId: locationId);
    }
  }
}
