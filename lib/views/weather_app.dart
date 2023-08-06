import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:weather_app/module/weather_locations.dart';
import 'package:weather_app/widgets/single_weather.dart';
import 'package:weather_app/widgets/slider.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  int _currentPage = 0;
  String bgImage = '';

  _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (locationList[_currentPage].weatherType == 'Rainy') {
      bgImage = 'assets/rainy.jpg';
    } else if (locationList[_currentPage].weatherType == 'Cloudy') {
      bgImage = 'assets/cloudy.jpeg';
    } else if (locationList[_currentPage].weatherType == 'Sunny') {
      bgImage = 'assets/sunny.jpg';
    } else if (locationList[_currentPage].weatherType == 'Night') {
      bgImage = 'assets/night.jpg';
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.search,
            size: 30,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () => print('Menu Clicked'),
              child: SvgPicture.asset(
                'assets/menu.svg',
                width: 30,
                height: 30,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              bgImage,
              fit: BoxFit.cover,
              height: double.infinity,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.black38,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 140,
                left: 15,
              ),
              child: Row(
                children: [
                  for (int i = 0; i < locationList.length; i++)
                    if (i == _currentPage)
                      SliderDot(isActive: true)
                    else
                      SliderDot(isActive: false),
                ],
              ),
            ),
            PageView.builder(
              itemBuilder: (context, i) => SingleWeather(index: i),
              itemCount: locationList.length,
              scrollDirection: Axis.horizontal,
              onPageChanged: _onPageChanged,
            ),
          ],
        ),
      ),
    );
  }
}
