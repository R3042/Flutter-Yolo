import 'package:flutter/material.dart';
import 'package:flutter_yolo_v2/buttons.dart';
import 'package:flutter_yolo_v2/theme.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            "assets/solar.png",
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Deteksi',
                  style: blackTextStyle.copyWith(
                    fontSize: 28,
                    fontWeight: black,
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Card(
                          color: greenColor,
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child:
                                      Image.asset("assets/imagedetection.png"),
                                ),
                                CustomFilledButton(
                                  width: MediaQuery.of(context).size.width,
                                  fontSize: 12,
                                  title: "Image Detection",
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/detectionimage');
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          color: greenColor,
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Image.asset("assets/realtime.png"),
                                ),
                                CustomFilledButton(
                                  fontSize: 10,
                                  width: MediaQuery.of(context).size.width,
                                  title: "Real Time Detection",
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/detectionreal');
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
