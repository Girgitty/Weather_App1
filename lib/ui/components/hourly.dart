import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/weathermodel.dart';

class Hourly extends StatelessWidget {
  final Hour? hour;

  const Hourly({Key? key, this.hour}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      width: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Text(hour?.tempC?.round().toString() ?? "",
                      style: const TextStyle(color: Colors.blueAccent,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),

         const Text(
              "o",
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 10,
              ),
            )
            ],
          ),

            Container(
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueAccent,
              ),
              child: Image.network(hour?.condition?.icon ?? ''),

            ),
            Text(DateFormat.j().format(DateTime.parse(hour?.time?.toString() ??"")),
            style: const TextStyle(
              color: Colors.blueAccent,
            ),)
          ],
    ),

    );
  }
}
