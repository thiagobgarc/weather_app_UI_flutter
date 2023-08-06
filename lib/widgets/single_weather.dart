import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/module/weather_locations.dart';

class SingleWeather extends StatelessWidget {
  final int index;
  const SingleWeather({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopText(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MiddleText(),
                    SmallerMiddleText(),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              BottomLine(),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        WindText(),
                        WindNumber(),
                        WindSpeed(),
                        Stack(
                          children: [
                            Container(
                              height: 5,
                              width: 50,
                              color: Colors.white38,
                            ),
                            Container(
                              height: 5,
                              width: 5,
                              color: Colors.greenAccent,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        RainText(),
                        RainNumber(),
                        RainPercentage(),
                        Stack(
                          children: [
                            Container(
                              height: 5,
                              width: 50,
                              color: Colors.white38,
                            ),
                            Container(
                              height: 5,
                              width: 5,
                              color: Colors.redAccent,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        HumidityText(),
                        HumidityNumber(),
                        HumidtytyPercentage(),
                        Stack(
                          children: [
                            Container(
                              height: 5,
                              width: 50,
                              color: Colors.white38,
                            ),
                            Container(
                              height: 5,
                              width: 5,
                              color: Colors.redAccent,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget TopText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 150,
        ),
        Text(
          locationList[index].city,
          style: GoogleFonts.lato(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          locationList[index].dateTime,
          style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

  Widget MiddleText() {
    return Text(
      locationList[index].temparature,
      style: GoogleFonts.lato(
        fontSize: 85,
        fontWeight: FontWeight.w300,
        color: Colors.white,
      ),
    );
  }

  Widget SmallerMiddleText() {
    return Row(
      children: [
        SvgPicture.asset(
          locationList[index].iconUrl,
          width: 34,
          color: Colors.white,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          locationList[index].weatherType,
          style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget BottomLine() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 40),
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.white30,
      )),
    );
  }

  Widget WindText() {
    return Text(
      'Wind',
      style: GoogleFonts.lato(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget WindNumber() {
    return Text(
      locationList[index].wind.toString(),
      style: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget WindSpeed() {
    return Text(
      'Km/h',
      style: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget RainText() {
    return Text(
      'Rain',
      style: GoogleFonts.lato(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget RainNumber() {
    return Text(
      locationList[index].rain.toString(),
      style: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget RainPercentage() {
    return Text(
      '%',
      style: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget HumidityText() {
    return Text(
      'Humidity',
      style: GoogleFonts.lato(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget HumidityNumber() {
    return Text(
      locationList[index].humidity.toString(),
      style: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  HumidtytyPercentage() {
    return Text(
      '%',
      style: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
