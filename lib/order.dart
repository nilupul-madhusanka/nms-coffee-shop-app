import 'package:flutter/material.dart';
import 'package:nms_coffee_shop/map.dart';

class CoffeeOrder extends StatefulWidget {
  const CoffeeOrder({super.key});

  @override
  State<CoffeeOrder> createState() => _CoffeeOrderState();
}

class _CoffeeOrderState extends State<CoffeeOrder> {
  int _quantity = 1;
  final double _price = 4.5;
  final double _deliveryFee = 2.0;

  @override
  Widget build(BuildContext context) {
    var totalPrice = _price * _quantity;
    var totalPayment = totalPrice + _deliveryFee;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Text(
                    'Order',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.deepOrangeAccent,
                      ),
                      onPressed: () {},
                      child: const Text("Deliver"),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.grey[200],
                      ),
                      onPressed: () {},
                      child: const Text("Pick Up"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Delivery Address
              const Text("Delivery Address",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text(
                "Jl. Kpg Sutoyo\nKpg. Sutoyo No. 620, Bilzen, Tanjungbalai",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Row(
                children: [
                  TextButton.icon(
                    icon: const Icon(Icons.edit),
                    label: const Text("Edit Address"),
                    onPressed: () {},
                  ),
                  TextButton.icon(
                    icon: const Icon(Icons.note_add),
                    label: const Text("Add Note"),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(),

              // Order Item
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/cappucino-1.png'),
                    radius: 24,
                  ),
                  const SizedBox(width: 10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Cappuccino",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Text("with Chocolate",
                          style: TextStyle(fontSize: 14, color: Colors.grey)),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        if (_quantity > 1) _quantity--;
                      });
                    },
                  ),
                  Text("$_quantity", style: const TextStyle(fontSize: 16)),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        _quantity++;
                      });
                    },
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(height: 20),
              const Divider(),

              // Discount Section
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.money, size: 16, color: Colors.orange),
                  Text("1 Discount is applied", style: TextStyle(fontSize: 14)),
                  Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                ],
              ),
              const Divider(),
              const SizedBox(height: 20),

              // Payment Summary (Demo Text)
              const Text("Payment Summary",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Price"),
                  Text("\$$totalPrice"),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Delivery Fee"),
                  Text("\$2.0"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Total Payment",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("\$$totalPayment ",
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 20),

              // Payment Method
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.orange[100],
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.money, color: Colors.orange),
                        SizedBox(width: 8),
                        Text("Cash", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    Text("\$$totalPayment",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const Spacer(),

              // Order Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrangeAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CoffeeDelivery()));
                },
                child: const Center(
                    child: Text("Order",
                        style: TextStyle(fontSize: 18, color: Colors.white))),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
