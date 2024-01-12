import 'package:flutter/material.dart';
import 'package:my_weather_app_flutter/constants/constants.dart';
import 'package:my_weather_app_flutter/pages/home_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Constants myConstants = Constants();
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
          width: size.width,
          height: size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/start.png'),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  },
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.6,
                    decoration: BoxDecoration(
                      color: myConstants.primaryColor,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: const Center(
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
