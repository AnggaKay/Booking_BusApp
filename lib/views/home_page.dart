import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<RouteInfo> routes = [
    RouteInfo(from: "Bandar Lampung", to: "Dayamurni", price: "30.000"),
    RouteInfo(from: "Menggala", to: "Bhakauni", price: "98.000"),
    RouteInfo(from: "Kota Bumi", to: "Palembang", price: "150.000"),
    RouteInfo(from: "Bandar Lampung", to: "Jakarta", price: "50.000"),
    RouteInfo(from: "Depok", to: "Bekasi", price: "120.000"),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFEFEFEF), // Soft gray background
        appBar: _buildAppBar(),
        body: _buildBody(),
        bottomNavigationBar: _buildAnimatedBottomNavigationBar(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 1,
      backgroundColor: Colors.white,
      title: Row(
        children: [
          Icon(FeatherIcons.mapPin, color: Color(0xFF4A4A4A)),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, Angga',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2E384D),
                ),
              ),
              Text(
                'Plan Your Trip',
                style: TextStyle(fontSize: 14, color: Color(0xFF4A4A4A)),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(FeatherIcons.bell, color: Color(0xFF4A4A4A)),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchForm(),
            SizedBox(height: 20),
            _buildSection('Popular Routes', _buildHorizontalList()),
            SizedBox(height: 20),
            _buildSection('Recent Searches', _buildHorizontalList()),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchForm() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        children: [
          _buildTextField(hintText: 'From', icon: FeatherIcons.mapPin),
          SizedBox(height: 15),
          _buildTextField(hintText: 'To', icon: FeatherIcons.mapPin),
          SizedBox(height: 15),
          _buildTextField(hintText: 'Date', icon: FeatherIcons.calendar),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(FeatherIcons.search, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  'Find Buses',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF007BFF), // Primary color
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({required String hintText, required IconData icon}) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Color(0xFF007BFF)),
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      ),
    );
  }

  Widget _buildSection(String title, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color(0xFF2E384D),
          ),
        ),
        SizedBox(height: 10),
        content,
      ],
    );
  }

  Widget _buildHorizontalList() {
    return Container(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: routes.length,
        itemBuilder: (context, index) {
          final route = routes[index];
          return _buildRouteCard(route);
        },
      ),
    );
  }

  Widget _buildRouteCard(RouteInfo route) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: 180,
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.network(
                'https://via.placeholder.com/200',
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset('assets/placeholder.png',
                      fit: BoxFit.cover);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(FeatherIcons.mapPin,
                        size: 14, color: Color(0xFF007BFF)),
                    SizedBox(width: 4),
                    Text('${route.from} → ${route.to}',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15)),
                  ],
                ),
                SizedBox(height: 4),
                Text('Harga ${route.price}',
                    style: TextStyle(color: Color(0xFF4A4A4A))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedBottomNavigationBar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8), // Padding for top and bottom
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(0, FeatherIcons.home, 'Home'),
          _buildNavItem(1, FeatherIcons.fileText, 'Tickets'),
          _buildNavItem(2, FeatherIcons.user, 'Profile'),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: Icon(
              icon,
              color: isSelected ? Color(0xFF007BFF) : Color(0xFF4A4A4A),
              size: isSelected ? 30 : 24, // Increase icon size when selected
            ),
          ),
          SizedBox(height: 4),
          AnimatedOpacity(
            duration: Duration(milliseconds: 300),
            opacity:
                isSelected ? 1.0 : 0.7, // Change opacity based on selection
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? Color(0xFF007BFF) : Color(0xFF4A4A4A),
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk transisi ke halaman berikutnya
  void navigateToHome(BuildContext context) {
    Navigator.of(context).push(_createRoute());
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0); // Mulai dari bawah
        const end = Offset.zero; // Berhenti di posisi akhir
        const curve = Curves.easeInOut; // Kurva transisi

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 500), // Durasi transisi
    );
  }
}

class RouteInfo {
  final String from;
  final String to;
  final String price;

  RouteInfo({required this.from, required this.to, required this.price});
}
