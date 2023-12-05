import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music/global%20widgets/designs/bouncing_button_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/splash_screen_placeholder.png',
            height: double.maxFinite,
            width: double.maxFinite,
            fit: BoxFit.cover,
          ),
          SafeArea(
              child: SizedBox(
            height: double.maxFinite,
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Feel the beat",
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w700,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Emmerse yourself into the\nworld of music today",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context)
                      .pushReplacementNamed('/HomeScreenPage'),
                  child: BouncingButtonWidget(
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.5,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(200)),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment(2, 1),
                          colors: <Color>[
                            Color(0xff842ED8),
                            Color(0xffDB28A9),
                            Color(0xff9D1DCA),
                          ],
                          tileMode: TileMode.mirror,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Continue",
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w600,
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
