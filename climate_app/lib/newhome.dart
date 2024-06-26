import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class weatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherApp(),
    );
  }
}

class WeatherApp extends StatefulWidget {
  @override
  _weatherAppState createState() => _weatherAppState();
}

class _weatherAppState extends State<WeatherApp> {
  DecorationImage _buildWeatherImage() {
    String imagePath = '';

    if (temperature > 30) {
      imagePath = 'images/sun.gif';
      show = greaterthen30();
    } else if (temperature > 21) {
      imagePath = 'images/cloud.gif';
      show = greaterthen20();
    } else if (temperature > 10) {
      imagePath = 'images/raingif.gif';
      show = lessthen20();
    } else if (temperature <= 5) {
      imagePath = 'images/snow.gif';
      show = lessthen20();
    }

    return DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover);
  }

  String apiKey = '9a7cf1644da0b43d16b0f30b7a5f1b15';
  String city = 'Chennai';
  late String apiUrl;

  double temperature = 38.0;
  String weatherDescription = '';
  double humidity = 0.0;
  double windSpeed = 0.0;

  TextEditingController cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';
    fetchWeather();
  }

  Future<void> fetchWeather() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        temperature = data['main']['temp'];
        weatherDescription = data['weather'][0]['description'];
        humidity = data['main']['humidity'].toDouble();
        windSpeed = data['wind']['speed'].toDouble();
      });
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  void updateWeather() {
    setState(() {
      city = cityController.text;
      apiUrl =
          'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';
    });
    fetchWeather();
  }

  Widget show = Container();

  List<Map<String, String>> lessthenten = [
    {
      "headline": "Sports",
      "content": "Do not go outside from the house",
    },
    {
      "headline": "Bussiness",
      "content": "Not suitable for a trip",
    },
    {
      "headline": "Cinema",
      "content": "Use blankets and drink hot water",
    },
    {
      "headline": "Cartoons",
      "content": "Some mosquitoe",
    },
    {
      "headline": "Elections",
      "content": "Do not wash your car",
    },
  ];
  Widget lessthen20() {
    return Container(
      width: 250,
      height: 160,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 10.0, crossAxisSpacing: 10.0),
          itemCount: 5,
          itemBuilder: (context, index) {
            return GridTile(
                child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                    child: Text(lessthenten[index]['content']!,
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ))),
              ),
            ));
          }),
    );
  }

  List<Map<String, String>> tentotwenty = [
    {
      "headline": "Sports",
      "content": "Do not wash your car",
    },
    {
      "headline": "Bussiness",
      "content": "suitable for a trip",
    },
    {
      "headline": "Elections",
      "content": "Use umbarella for today",
    },
    {
      "headline": "Elections",
      "content": "Some mosquitoe",
    },
    {
      "headline": "Elections",
      "content": "Drink hot Water",
    },
  ];
  Widget greaterthen20() {
    return Container(
      width: 250,
      height: 160,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 10.0, crossAxisSpacing: 10.0),
          itemCount: 5,
          itemBuilder: (context, index) {
            return GridTile(
              child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(tentotwenty[index]['content']!,
                          style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 255, 255, 255),
                          )),
                    ),
                  )),
            );
          }),
    );
  }

  List<Map<String, String>> headlines = [
    {
      "headline": "Sports",
      "content": "Use oil-control products",
    },
    {
      "headline": "Icon(Icons.car)",
      "content": "Suitable for a trip",
    },
    {
      "headline": "Cinema",
      "content": "Suitable for outdoor workouts",
    },
    {
      "headline": "Cartoons",
      "content": "Some mosquitoe",
    },
    {
      "headline": "Elections",
      "content": "wash your car",
    },
  ];

  Widget greaterthen30() {
    return Container(
      width: 250,
      height: 160,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 10.0, crossAxisSpacing: 10.0),
          itemCount: 5,
          itemBuilder: (context, index) {
            return GridTile(
                child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                    child: Text(headlines[index]['content']!,
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ))),
              ),
            ));
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: fetchWeather,
        child: Center(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: _buildWeatherImage(),
            ),
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        Text(
                          '$city',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 250,
                  height: 50,
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    controller: cityController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Enter CityName',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    onSubmitted: (_) => updateWeather(),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: Colors.black
                        .withOpacity(0.5), // Set background image decoration
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${temperature.toStringAsFixed(1)}°C',
                        style: TextStyle(fontSize: 80, color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Weather: $weatherDescription',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white
                              .withOpacity(0.1), // Set opacity to 0.5
                          borderRadius:
                              BorderRadius.circular(20), // Set border radius
                        ),
                        child: ListTile(
                          title: Text(
                            'Weather: $weatherDescription',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white
                              .withOpacity(0.1), // Set opacity to 0.5
                          borderRadius:
                              BorderRadius.circular(20), // Set border radius
                        ),
                        child: ListTile(
                          title: Text(
                            'Humidity: ${humidity.toStringAsFixed(1)}%',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white
                              .withOpacity(0.1), // Set opacity to 0.5
                          borderRadius:
                              BorderRadius.circular(20), // Set border radius
                        ),
                        child: ListTile(
                          title: Text(
                            'Air Flow: ${windSpeed.toStringAsFixed(1)} m/s',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Life Tips',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      show,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
