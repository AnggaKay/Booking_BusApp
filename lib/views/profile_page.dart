import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal[800],
        title: Text('Profile', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture and Name
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                      'URL_TO_PROFILE_IMAGE'), // Ganti dengan URL gambar profil
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Kayal Vizhi',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('+41 6232 283 8324',
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.teal[800]),
                  onPressed: () {
                    // Aksi untuk mengedit profil
                  },
                ),
              ],
            ),
            SizedBox(height: 40),
            // Menu Items
            _buildMenuItem(Icons.book, 'Bookings', context),
            _buildMenuItem(Icons.people, 'Passengers list', context),
            _buildMenuItem(Icons.wallet_giftcard, 'Wallet', context),
            _buildMenuItem(Icons.card_giftcard, 'Refer & Earn', context),
            _buildMenuItem(Icons.local_offer, 'Offers', context),
            _buildMenuItem(Icons.help, 'FAQ\'s & Support', context),
            _buildMenuItem(Icons.info, 'About Us', context),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Aksi saat item menu ditekan, bisa navigasi ke halaman baru
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.teal[800]),
            SizedBox(width: 20),
            Text(title, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.teal[800],
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem(Icons.home, 'Home', () {
            Navigator.popUntil(
                context, ModalRoute.withName('/')); // Kembali ke halaman utama
          }),
          _buildNavItem(Icons.receipt_long, 'Bookings', () {
            // Navigasi ke halaman bookings
          }),
          _buildNavItem(Icons.person, 'Profile', () {
            // Navigasi ke halaman profil
          }),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white),
          Text(label, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
