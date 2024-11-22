import 'package:flutter/material.dart';
import 'package:nms_coffee_shop/shop.dart';

class CoffeeHome extends StatelessWidget {
  const CoffeeHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 590),
            child: Text(
              "Coffee so good, your taste buds will love it.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  height: 1),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 40, right: 40, top: 710),
            child: Text(
              "The best grain, the finest roast, the powerful flavor.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CoffeeShop(),
                ),
              );
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 750),
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 100, top: 20, bottom: 20, right: 100),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 193, 128, 32),
                  ),
                  child: const Text(
                    "Get Started",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
