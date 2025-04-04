import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
          color: Color(0xFF2C3E50),
        ),
      ),
    );
  }

  Widget _buildFeatureCard(String feature) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.check_circle_outline,
              color: Colors.orange,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              feature,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF2C3E50),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.withOpacity(0.1)),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: iconColor),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'About Us',
          style: TextStyle(
            color: Color(0xFF2C3E50),
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF2C3E50)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          // About Section
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.orange.shade400,
                  Colors.orange.shade300,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'The Word',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'The Word is an app designed to help you know and understand various concepts in the Bible explanatively. Our goal is to provide a seamless experience for users to get to know, understand, and appreciate the various concepts in the Bible with ease.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),

          // Features Section
          _buildSectionTitle('Features'),
          _buildFeatureCard('Explore a wide range of topics and concepts'),
          _buildFeatureCard('Add topics to your favourite sections purchases easily'),
          _buildFeatureCard('Manage your profile and view your order history'),
          _buildFeatureCard('Contact us through various social media platforms'),

          // Contact Section
          _buildSectionTitle('Contact Us'),
          _buildContactCard(
            icon: Icons.phone,
            iconColor: Colors.green,
            title: 'Phone',
            subtitle: '+1 234 567 890',
            onTap: () {},
          ),
          _buildContactCard(
            icon: Icons.email,
            iconColor: Colors.red,
            title: 'Email',
            subtitle: 'contact@TheWord.com',
            onTap: () {},
          ),
          _buildContactCard(
            icon: Icons.location_on,
            iconColor: Colors.blue,
            title: 'Address',
            subtitle: '1234 Street Name, City, Country',
            onTap: () {},
          ),

          // Social Media Section
          _buildSectionTitle('Connect With Us'),
          _buildContactCard(
            icon: Icons.facebook,
            iconColor: const Color(0xFF1877F2),
            title: 'Facebook',
            subtitle: 'facebook.com/TheWord',
            onTap: () {},
          ),
          _buildContactCard(
            icon: Icons.message,
            iconColor: const Color(0xFF1DA1F2),
            title: 'Twitter',
            subtitle: 'twitter.com/TheWord',
            onTap: () {},
          ),
          _buildContactCard(
            icon: Icons.camera_alt,
            iconColor: const Color(0xFFE4405F),
            title: 'Instagram',
            subtitle: 'instagram.com/TheWord',
            onTap: () {},
          ),
          _buildContactCard(
            icon: Icons.play_circle_filled,
            iconColor: const Color(0xFFFF0000),
            title: 'YouTube',
            subtitle: 'youtube.com/TheWord',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}