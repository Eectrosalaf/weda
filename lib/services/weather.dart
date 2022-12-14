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
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition  < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
