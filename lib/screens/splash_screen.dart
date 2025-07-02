import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFF0000),
              Color(0xFF1AB8DB),
            ],
          ),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 700,
              margin: const EdgeInsets.symmetric(horizontal: 35),
              padding: const EdgeInsets.only(top: 50, bottom: 40),
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Image.asset('assets/images/logo.png', width: 200, height: 200),
                      const SizedBox(height: 0),
                      const Column(
                        children: [
                          Text(
                            'MAKE SUCCESSFUL',
                            style: TextStyle(
                              fontFamily: 'CreepsterCaps',
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'YOUR DAY',
                            style: TextStyle(
                              fontFamily: 'CreepsterCaps',
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 100),
                      const Column(
                        children: [
                          Text(
                            'Make small somethings to get',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFFC1CC41),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'big gift in your life',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFFC1CC41),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        // HomePage'e geçiş yap (pushReplacement kullanıyoruz)
                        Navigator.pushReplacementNamed(context, '/home');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1AB8DB),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Start',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}