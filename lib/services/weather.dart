import 'package:weda/services/location.dart';
import 'package:weda/services/networking.dart ';
const apikey = "0065a30b808a7e762a946223a9729c94";
const metric ="units=metric";

const openwedaURL='https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getcityinfo(String cityname)async {
    var url ='$openwedaURL?q=$cityname&appid=$apikey&$metric';
    NetworkH  networkH = NetworkH('$openwedaURL?q=$cityname&appid=$apikey&$metric');
    var weatherData = await networkH.getdata();

    return weatherData;


  }

  Future<dynamic> getlocData()async{

    Location location = Location();
await location.getNewLocation();

NetworkH  networkH = NetworkH('$openwedaURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&$metric');
var weatherData = await networkH.getdata();

return weatherData;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition  < 600) {
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
