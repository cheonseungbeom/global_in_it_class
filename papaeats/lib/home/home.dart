import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery App',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '미추홀구 인하로91번길 86',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            Icon(Icons.arrow_drop_down, color: Colors.black),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.tune, color: Colors.grey),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search, color: Colors.grey),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '치즈쭈꾸미 나와라 뚝딱!!',
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
            
            // Banner
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.blue[50],
                child: Row(
                  children: [
                    Icon(Icons.star, color: Colors.blue),
                    SizedBox(width: 8.0),
                    Text('배민클럽 | 무료이용권+3천원 쿠폰의 기회'),
                  ],
                ),
              ),
            ),
            
            // Category Tabs
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildCategoryTab('음식배달', isSelected: true),
                    _buildCategoryTab('가게배달'),
                    _buildCategoryTab('장보기·쇼핑'),
                    _buildCategoryTab('포장'),
                    _buildCategoryTab('선물하기'),
                  ],
                ),
              ),
            ),
            
            // Food Categories Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 4,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildCategoryIcon(Icons.local_pizza, '치킨'),
                  _buildCategoryIcon(Icons.ramen_dining, '중식'),
                  _buildCategoryIcon(Icons.sushi, '돈까스·회'),
                  _buildCategoryIcon(Icons.local_pizza, '피자'),
                  _buildCategoryIcon(Icons.fastfood, '패스트푸드'),
                  _buildCategoryIcon(Icons.food_bank, '찜·탕'),
                  _buildCategoryIcon(Icons.rice_bowl, '족발·보쌈'),
                  _buildCategoryIcon(Icons.local_cafe, '분식'),
                  _buildCategoryIcon(Icons.cake, '카페·디저트'),
                  _buildCategoryIcon(Icons.local_drink, '스타벅스'),
                ],
              ),
            ),
            
            // More Button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextButton(
                onPressed: () {},
                child: Text('음식배달에서 더보기 >', style: TextStyle(color: Colors.black)),
              ),
            ),
            
            // Convenience Stores Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildStoreIcon('B마트'),
                    _buildStoreIcon('세븐일레븐'),
                    _buildStoreIcon('GS25'),
                    _buildStoreIcon('GS더프레시'),
                    _buildStoreIcon('CU'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), label: '장보기·쇼핑'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: '찜'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: '주문내역'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이배민'),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  Widget _buildCategoryTab(String label, {bool isSelected = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      margin: EdgeInsets.only(right: 8.0),
      decoration: BoxDecoration(
        color: isSelected ? Colors.green[50] : Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        label,
        style: TextStyle(color: isSelected ? Colors.green : Colors.black),
      ),
    );
  }

  Widget _buildCategoryIcon(IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: Colors.grey[200],
          child: Icon(icon, color: Colors.black),
        ),
        SizedBox(height: 8.0),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildStoreIcon(String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.grey[200],
            child: Text(
              label[0],
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 8.0),
          Text(label),
        ],
      ),
    );
  }
}
