import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_yolo_v2/buttons.dart';
import 'package:flutter_yolo_v2/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Image.asset("assets/people.png")),
          Expanded(
            child: Container(
              color: greenColor,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Welcome',
                        style: whiteTextStyle.copyWith(
                          fontSize: 42,
                          fontWeight: black,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Mari kita mulai dan jadikan dunia tempat yang lebih bersih untuk generasi mendatang!',
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: regular,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 40),
                    child: CustomFilledButton(
                      width: MediaQuery.of(context).size.width / 2,
                      title: "Get Started",
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
