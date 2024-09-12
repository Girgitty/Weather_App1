import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:intl/intl.dart';
import 'package:project5/model/weathermodel.dart';

class TodaysWeather extends StatelessWidget {
  final weathermodel? weatherModel;

  const TodaysWeather({Key? key, this.weatherModel}) : super(key: key);

  WeatherType getWeatherType(Current? current){

if(current?.isDay == 1){
  if(current?.condition?.text == "Sunny"){
    return WeatherType.sunny;
  }else if(current?.condition?.text=="OverCast"){
    return WeatherType.overcast;
  }
  else if(current?.condition?.text=="Partly Cloudy"){
    return WeatherType.cloudy;
  }
  else if(current?.condition?.text=="Cloudy"){
    return WeatherType.cloudy;
  }
  else if(current?.condition?.text=="Mist"){
    return WeatherType.lightSnow;
  }
  else if(current!.condition!.text!.contains("thunder")){
    return WeatherType.thunder;
  }
  else if(current!.condition!.text!.contains("rain")){
    return WeatherType.heavyRainy;
  }
  else if(current!.condition!.text!.contains("showers")){
    return WeatherType.middleSnow;
  }
  else if(current!.condition!.text!.contains("thunder")){
    return WeatherType.thunder;
  }
  else if(current!.condition!.text!.contains("clear")){
    return WeatherType.sunny;
  }
}
  else{
    if(current?.condition?.text == "Sunny"){
    return WeatherType.sunny;
  }else if(current?.condition?.text=="OverCast"){
    return WeatherType.overcast;
  }
  else if(current?.condition?.text=="Partly Cloudy"){
    return WeatherType.cloudy;
  }
  else if(current?.condition?.text=="Cloudy"){
    return WeatherType.cloudyNight;
  }
  else if(current?.condition?.text=="Mist"){
    return WeatherType.lightSnow;
  }
  else if(current!.condition!.text!.contains("thunder")){
    return WeatherType.thunder;
  }
  else if(current!.condition!.text!.contains("rain")){
    return WeatherType.heavyRainy;
  }
  else if(current!.condition!.text!.contains("showers")){
    return WeatherType.middleSnow;
  }
  else if(current!.condition!.text!.contains("thunder")){
    return WeatherType.thunder;
  }
  else if(current!.condition!.text!.contains("clear")){
    return WeatherType.sunnyNight;
  }

  }

    return WeatherType.thunder;
  }


  @override

  Widget build(BuildContext context) {
    return Stack(
      children: [
        WeatherBg(
            weatherType: getWeatherType(weatherModel?.current),
            width: MediaQuery.of(context).size.width,
            height: 300),
        SizedBox(
          width: double.infinity,
          height: 300,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text(
                      weatherModel?.location?.name ?? "",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      DateFormat.yMMMMEEEEd().format(DateTime.parse(
                          weatherModel?.current?.lastUpdated.toString() ?? "")),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
               const  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                       shape: BoxShape.circle, color: Colors.white12),
                    child: Image.network(
                        weatherModel?.current?.condition?.icon ?? ""),
                  ),

                  Spacer(),
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: Text(
                              weatherModel?.current?.tempC?.round()
                                  .toString() ?? "",
                              style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                          ),


                       const   Text(
                            "O",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                      Text(weatherModel?.current?.condition?.text ?? "",
                      style: const TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: Colors.white),
                      )
                    ],
                  ),
                 const SizedBox(width: 10,),
  ],
    ),


              Container(
                margin: EdgeInsets.all(10),
                 padding: EdgeInsets.all(10),
                 decoration: BoxDecoration(
                  color: Colors.white12,
                 borderRadius: BorderRadius.circular(30)
                          ),
                 child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                      Column(
                        children: [
                        const  Text("Feels Like",
                           style: TextStyle(
                             fontStyle: FontStyle.italic,
                             fontSize: 15,
                             color: Colors.white,
                             fontWeight: FontWeight.w200,
                           ),),

                        Text(weatherModel?.current?.feelslikeC?.round().toString()??"",
                            style: const TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),),

                        ],
                      ),
                       Column(
                         children: [
                           const  Text("Wind",
                             style: TextStyle(
                               fontStyle: FontStyle.italic,
                               fontSize: 15,
                               color: Colors.white,
                               fontWeight: FontWeight.w200,
                             ),),

                           Row(

                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Padding(
                                 padding: const EdgeInsets.only(top: 2.0),
                                 child: Text("${weatherModel?.current?.windKph?.round().toString()??""} Km/h",
                                   style: const TextStyle(
                                     fontStyle: FontStyle.italic,
                                     fontSize: 12,
                                     color: Colors.white,
                                     fontWeight: FontWeight.bold,
                                   ),

                                 ),
                               ),
                             const  Text(
                                 "O",
                                 style: TextStyle(
                                   fontSize: 5,
                                   fontWeight: FontWeight.bold,
                                   color: Colors.white,
                                 ),)
                             ],
                           ),

                         ],
                       ),

                     ],
                   ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            const  Text("Humidity",
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w200,
                              ),),

                            Text("${weatherModel?.current?.humidity}%",
                              style: const TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),),

                          ],
                        ),
                        Column(
                          children: [
                            const  Text("Visibility",
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w200,
                              ),),


                            Text("${weatherModel?.current?.visKm?.toString()??""} Km",
                                    style: const TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),

                                  ),


                          ],
                        ),

                      ],
                    ),
                  ],
                 )
              ),

            ],
          ),
        )
      ],
    );
  }
}
