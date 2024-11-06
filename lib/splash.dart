import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/homepage');
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        },
        child: Center(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 3,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                'assets/logo2.png',
              ),
            )),
          ),
        ),
      ),
    );
  }
}
