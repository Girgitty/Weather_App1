import 'package:flutter/material.dart';
import 'package:project5/model/weathermodel.dart';
import 'package:project5/service/api_service.dart';
import 'package:project5/ui/components/futureforecast.dart';
import 'package:project5/ui/components/hourly.dart';
import 'package:project5/ui/components/todays_weather.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ApiService apiService = ApiService();

  final _textFieldController = TextEditingController();
  String searchText = "auto:ip";
  _showTextInputDialog(BuildContext context)async{
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Search Location"),
        content: TextField(
        controller: _textFieldController,
        decoration: InputDecoration(hintText: "Search by city,zip,lat,lang"),
      ),
        actions: [
          ElevatedButton(onPressed: ()
      {
        Navigator.pop(context);
      },child: Text("Cancel"),
          ),
          ElevatedButton(onPressed: ()
          {
            if(_textFieldController.text.isEmpty){
              return;
            }


            Navigator.pop(context,_textFieldController.text);
          },
            child: Text("Okay"),
          ),
        ],
      );
    }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text("Weather App"),
        actions: [
          IconButton(onPressed: ()async{
        String text =  await _showTextInputDialog(context);
        setState(() {
          searchText = text;
        });
          }, icon: Icon(Icons.search)),
          IconButton(onPressed: (){
            searchText = "auto:ip";
            setState(() {

            });
          }, icon: Icon(Icons.my_location)),
        ],
      ),
      body: SafeArea(
       child: FutureBuilder(
         builder: (context, snapshot){
           if(snapshot.hasData){
             weathermodel? weatherModel = snapshot.data;
             return SizedBox(
               width: double.infinity,
               child: Column(
                 children: [
                   TodaysWeather(
                      weatherModel: weatherModel,
                    ),

                const SizedBox(height: 10,),
                 const  Text(
                     "Weather by hours",
                     style: TextStyle(
                       color: Colors.white,
                       fontSize: 20,
                     ),
                   ),
                   const SizedBox(height: 10,),

                   SizedBox(
                     height: 150,
                     child: ListView.builder(itemBuilder: (context,index) {
                       Hour? hour =weatherModel?.forecast?.forecastday?[0].hour?[index];
                       return Hourly(hour: hour);
                     },
                       itemCount: weatherModel?.forecast?.forecastday?[0].hour?.length,
                       scrollDirection: Axis.horizontal,
                     ),
                   ),
                   const SizedBox(height: 10,),
                   const  Text(
                     "Next 7 Days Weather forecast",
                     style: TextStyle(
                       color: Colors.white,
                       fontSize: 20,
                     ),
                   ),
                   const SizedBox(height: 10,),
                   Expanded(
                     child: ListView.builder(itemBuilder: (context,index){
                                       Forecastday? forcastday = weatherModel?.forecast?.forecastday?[index];
                     return Futureforecast(forecastday: forcastday,
                     );
                     },itemCount: weatherModel?.forecast?.forecastday?.length,
                     ),
                   )
                 ],
               ),
             );
            }
            if(snapshot.hasError){
         return const Center(
                child: Text("Error has Occurred"),
              );
            }
        return const Center(
          child: CircularProgressIndicator(),
        );
    },
      future: apiService.getWeatherData(searchText),
    ),
      ),
    );
  }
}
