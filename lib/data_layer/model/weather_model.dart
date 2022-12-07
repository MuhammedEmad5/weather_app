class WeatherModel {
  List<WeatherStatus>? weatherStatus;
  WeatherDegrees? weatherDegrees;
  Wind? wind;
  Clouds? clouds;
  Rain? rain;
  Snow? snow;
  int? timezone;
  int? id;
  String? countryName;

  WeatherModel(
      {this.weatherStatus,
      this.weatherDegrees,
      this.wind,
      this.clouds,
      this.timezone,
      this.id,
      this.countryName,
      this.snow,
      this.rain,});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    if (json['weather'] != null) {
      weatherStatus = <WeatherStatus>[];
      json['weather'].forEach((v) {
        weatherStatus!.add( WeatherStatus.fromJson(v));
      });
    }
    weatherDegrees = json['main'] != null ? WeatherDegrees.fromJson(json['main']) : null;
    wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    clouds = json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    rain = json['rain'] != null ? Rain.fromJson(json['rain']) : null;
    snow = json['snow'] != null ? Snow.fromJson(json['snow']) : null;
    timezone = json['timezone'];
    id = json['id'];
    countryName = json['name'];
  }

}

class WeatherStatus {
  int? id;
  String? mainStatus;
  String? description;

  WeatherStatus({
    this.id,
    this.mainStatus,
    this.description,
  });

  WeatherStatus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mainStatus = json['main'];
    description = json['description'];
  }
}

class WeatherDegrees {
  double? temp;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;

  WeatherDegrees(
      {this.temp, this.tempMin, this.tempMax, this.pressure, this.humidity});

  WeatherDegrees.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
  }
}

class Wind {
  double? speed;

  Wind({this.speed});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
  }
}

class Rain {
  double? rainNextHour;

  Rain({this.rainNextHour});

  Rain.fromJson(Map<String, dynamic> json) {
    rainNextHour = json['1h'];
  }
}

class Snow {
  double? snowNextHour;

  Snow({this.snowNextHour});

  Snow.fromJson(Map<String, dynamic> json) {
    snowNextHour = json['1h'];
  }
}

class Clouds {
  int? cloudiness;

  Clouds({this.cloudiness});

  Clouds.fromJson(Map<String, dynamic> json) {
    cloudiness = json['all'];
  }
}
