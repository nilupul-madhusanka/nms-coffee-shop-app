import 'package:flutter/material.dart';

class CoffeeDelivery extends StatelessWidget {
  const CoffeeDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Map Background
          Positioned.fill(
            top: 24,
            child: Stack(
              children: [
                Image.asset(
                  'assets/map2.png',
                  fit: BoxFit.cover,
                ),
                // Road Path Overlay
                Positioned.fill(
                  child: CustomPaint(
                    painter: RoadPathPainter(),
                  ),
                ),
              ],
            ),
          ),
          // Sliding Drawer
          Align(
            alignment: Alignment.bottomCenter,
            child: DraggableScrollableSheet(
              initialChildSize: 0.25,
              minChildSize: 0.25,
              maxChildSize: 0.4,
              builder: (context, scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 5,
                        blurRadius: 7,
                      ),
                    ],
                  ),
                  child: ListView(
                    controller: scrollController,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          children: [
                            // Delivery status text
                            const Text(
                              '10 minutes left',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'Delivery to Jl. Kpg Sutoyo',
                              style: TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(height: 20),
                            // Delivery progress bar
                            LinearProgressIndicator(
                              value: 0.7,
                              backgroundColor: Colors.grey[300],
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                  Colors.green),
                            ),
                            const SizedBox(height: 20),
                            // Delivery details
                            const ListTile(
                              leading: Icon(Icons.local_shipping,
                                  color: Colors.orange),
                              title: Text('Delivered your order'),
                              subtitle: Text(
                                  'We deliver your goods to you in the shortest possible time.'),
                            ),
                            const Divider(),
                            // Courier info
                            ListTile(
                              leading: const CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/profile.png'),
                              ),
                              title: const Text('Johan Hawn'),
                              subtitle: const Text('Personal Courier'),
                              trailing: IconButton(
                                icon: const Icon(Icons.phone_android),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Back button
          Positioned(
            top: 40,
            left: 20,
            child: FloatingActionButton(
              mini: true,
              backgroundColor: Colors.white,
              elevation: 2,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back, color: Colors.black),
            ),
          ),
          const Positioned(
            top: 300,
            left: 225,
            child: Icon(
              Icons.delivery_dining_rounded,
              size: 45,
            ),
          ),
          const Positioned(
            top: 140,
            left: 115,
            child: Icon(
              Icons.food_bank,
              size: 40,
            ),
          ),
          const Positioned(
            top: 480,
            left: 108,
            child: Icon(
              Icons.location_on,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}

class RoadPathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final Path path = Path();
    path.moveTo(size.width * 0.3, size.height * 0.202);
    path.lineTo(size.width * 0.6, size.height * 0.195);
    path.lineTo(size.width * 0.605, size.height * 0.679);
    path.lineTo(size.width * 0.31, size.height * 0.66);
    path.lineTo(size.width * 0.31, size.height * 0.58);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
