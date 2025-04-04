import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  Widget _buildContactCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String buttonText,
    VoidCallback? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: iconColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        icon,
                        color: iconColor,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2C3E50),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            subtitle,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: iconColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        buttonText,
                        style: TextStyle(
                          color: iconColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward,
                        size: 16,
                        color: iconColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Contact Us',
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
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue.shade400,
                  Colors.blue.shade300,
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
                  'Get in Touch',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "We're here to help and answer any questions you might have. We look forward to hearing from you.",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _buildContactCard(
            icon: Icons.phone,
            iconColor: Colors.green,
            title: 'Phone',
            subtitle: '+233 0234 567 890',
            buttonText: 'Call now',
            onTap: () {},
          ),
          _buildContactCard(
            icon: Icons.email,
            iconColor: Colors.red,
            title: 'Email',
            subtitle: 'contact@gmail.com',
            buttonText: 'Send email',
            onTap: () {},
          ),
          _buildContactCard(
            icon: Icons.location_on,
            iconColor: Colors.blue,
            title: 'Address',
            subtitle: 'Aboum Junction-Kwabenya, Accra, Ghana',
            buttonText: 'Get directions',
            onTap: () {},
          ),
          const SizedBox(height: 16),
          const Text(
            'Social Media',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 16),
          _buildContactCard(
            icon: Icons.facebook,
            iconColor: const Color(0xFF1877F2),
            title: 'Facebook',
            subtitle: 'facebook.com/churchofchrist',
            buttonText: 'Follow us',
            onTap: () {},
          ),
          _buildContactCard(
            icon: Icons.alternate_email,
            iconColor: const Color(0xFF1DA1F2),
            title: 'Twitter',
            subtitle: 'twitter.com/churchofchrist',
            buttonText: 'Follow us',
            onTap: () {},
          ),
          _buildContactCard(
            icon: Icons.camera_alt,
            iconColor: const Color(0xFFE4405F),
            title: 'Instagram',
            subtitle: 'instagram.com/churchofchrist',
            buttonText: 'Follow us',
            onTap: () {},
          ),
          _buildContactCard(
            icon: Icons.play_circle_filled,
            iconColor: const Color(0xFFFF0000),
            title: 'YouTube',
            subtitle: 'youtube.com/churchofchrist',
            buttonText: 'Subscribe',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}