import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apikey = 'f0c6ac07b403624d4eb58ad25ea6b4a6';
const openWeatherUrl = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async {

    String url = "$openWeatherUrl?q=$cityName&appid=$apikey&units=metric";
    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location myLocation = Location();
    await myLocation.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper("$openWeatherUrl?lat=${myLocation.latitude}&lon=${myLocation.longitude}&appid=$apikey&units=metric");

    var weatherData = await networkHelper.getData();
    return weatherData;

  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
