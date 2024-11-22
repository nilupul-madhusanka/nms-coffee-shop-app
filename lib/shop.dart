import 'package:flutter/material.dart';
import 'package:nms_coffee_shop/buy.dart';

class CoffeeShop extends StatelessWidget {
  CoffeeShop({super.key});
  final List<Map<String, String>> coffeeItems = [
    {
      'image': 'assets/c1.png',
      'name': 'Cappuccino',
      'description': 'with Chocolate',
      'price': '4.53'
    },
    {
      'image': 'assets/c2.png',
      'name': 'Cappuccino',
      'description': 'with Oat Milk',
      'price': '3.90'
    },
    {
      'image': 'assets/c3.png',
      'name': 'Latte',
      'description': 'with Almond Milk',
      'price': '4.25'
    },
    {
      'image': 'assets/c4.png',
      'name': 'Espresso',
      'description': 'Strong and Rich',
      'price': '2.80'
    },
    {
      'image': 'assets/c2.png',
      'name': 'Latte',
      'description': 'with Almond Milk',
      'price': '4.25'
    },
    {
      'image': 'assets/c1.png',
      'name': 'Espresso',
      'description': 'Strong and Rich',
      'price': '2.80'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Location and Profile
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Location',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.orange),
                            SizedBox(width: 4),
                            Text(
                              'Bilzen, Tanjungbalai',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/profile.png'),
                      radius: 25,
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Search Bar

                SearchAnchor(
                  builder: (BuildContext context, SearchController controller) {
                    return SearchBar(
                      controller: controller,
                      padding: const WidgetStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 16.0),
                      ),
                      leading: const Icon(Icons.search),
                      hintText: "Search Coffee",
                      trailing: const <Widget>[Icon(Icons.coffee)],
                    );
                  },
                  suggestionsBuilder:
                      (BuildContext context, SearchController controller) {
                    return List.empty();
                  },
                ),
                const SizedBox(height: 20),

                // Promo Banner
                Container(
                  height: 150,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: AssetImage('assets/promo1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Coffee Categories
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildCategoryChip('Cappuccino', true),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildCategoryChip('Machiatto', false),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildCategoryChip('Latte', false),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildCategoryChip('Americano', false),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildCategoryChip('Latte', false),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildCategoryChip('Cappuccino', false),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Coffee Items grid
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: coffeeItems.length,
                  itemBuilder: (context, index) {
                    final item = coffeeItems[index];
                    return _buildCoffeeItem(
                      context,
                      image: item['image']!,
                      name: item['name']!,
                      description: item['description']!,
                      price: item['price']!,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const ImageIcon(
                AssetImage("assets/Home.png"),
                color: Colors.deepOrange,
              ),
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/Heart.png"),
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/Bag.png"),
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/Notification.png"),
            ),
            label: '',
          ),
        ],
      ),
    );
  }

  // Helper function for category chips
  Widget _buildCategoryChip(String label, bool isSelected) {
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      selectedColor: Colors.orange,
      backgroundColor: Colors.white,
      onSelected: (_) {},
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // Helper function for coffee item cards
  Widget _buildCoffeeItem(
    BuildContext context, {
    required String image,
    required String name,
    required String description,
    required String price,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Coffee Image
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Coffee Name and Price
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            description,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$$price',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.orange,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CoffeeBuy()),
                  );
                },
                child: const CircleAvatar(
                  backgroundColor: Colors.deepOrangeAccent,
                  radius: 16,
                  child: Icon(Icons.add, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
