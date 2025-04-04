import 'package:flutter/material.dart';
import 'topic_details.dart'; // Import the topic details screen

import 'home_screen.dart';
import 'signup_screen.dart';
import 'help_feedback_screen.dart';
import 'history_screen.dart';
import 'settings_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isGridView = true;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  final List<Map<String, dynamic>> topics = [
    {'title': 'Giving', 'icon': Icons.attach_money, 'color': Colors.green},
    {'title': 'Baptism', 'icon': Icons.water, 'color': Colors.blue},
    {'title': 'Miracles', 'icon': Icons.calendar_today, 'color': Colors.purple},
    {'title': 'Faith', 'icon': Icons.verified, 'color': Colors.orange},
    {'title': 'Prayer', 'icon': Icons.air, 'color': Colors.teal},
    {'title': 'Salvation', 'icon': Icons.saved_search, 'color': Colors.red},
    {'title': 'Church', 'icon': Icons.grass, 'color': Colors.lightGreen},
    {'title': 'Lord\'s Supper', 'icon': Icons.favorite, 'color': Colors.pink},
    {'title': 'Doctrine', 'icon': Icons.forum, 'color': Colors.indigo},
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleView() {
    setState(() {
      isGridView = !isGridView;
      _controller.reset();
      _controller.forward();
    });
  }

  void _openTopicDetails(String topic) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => TopicDetailsScreen(topic: topic),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.easeOutCubic;
          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: _buildNavigationDrawer(),
      body: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('images/bg1.jpg'),
            fit: BoxFit.cover,
          ),
          color: Colors.black.withOpacity(0.7),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildCustomAppBar(),
              Expanded(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: isGridView ? _buildGridView() : _buildListView(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationDrawer() {
    return Drawer(
      child: Container(
        color: Colors.black87,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _buildDrawerHeader(),
            ..._buildDrawerItems(),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerHeader() {
    return DrawerHeader(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.blue.shade300],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.2),
            ),
            child: const CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 35, color: Colors.blue),
            ),
          ),
          const SizedBox(height: 11),
          const Text(
            'The Word',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              height: -0.5,
            ),
          ),
          Flexible(
            child: Text(
              'Explore & Learn',
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 16,
                letterSpacing: 0.8,
                height: -1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildDrawerItems() {
    final items = [
      {'icon': Icons.home, 'title': 'Home', 'screen': const LoginScreen()},
      {'icon': Icons.contact_page, 'title': 'Contact', 'screen': const SignupScreen()},
      {'icon': Icons.history, 'title': 'History', 'screen': const HistoryScreen()},
      {'icon': Icons.settings, 'title': 'Settings', 'screen': const SettingsScreen()},
      {'icon': Icons.help_outline, 'title': 'Help & Feedback', 'screen': const HelpFeedbackScreen()},
      {'icon': Icons.info_outline, 'title': 'About', 'screen': const HomeScreen()},
    ];

    List<Widget> widgets = [];
    for (var item in items) {
      if (items.indexOf(item) == 4) {
        widgets.add(const Divider(color: Colors.white24));
      }
      widgets.add(_buildDrawerItem(item['icon'] as IconData, item['title'] as String, item['screen'] as Widget));
    }
    return widgets;
  }

  Widget _buildDrawerItem(IconData icon, String title, Widget screen) {
    return ListTile(
      leading: Icon(icon, color: Colors.white70),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white70),
      ),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => screen,
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildCustomAppBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          _buildAnimatedIconButton(
            Icons.menu,
            () => _scaffoldKey.currentState?.openDrawer(),
          ),
          const Expanded(
            child: Text(
              'Topics',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ),
          _buildAnimatedIconButton(
            isGridView ? Icons.view_list : Icons.grid_view,
            _toggleView,
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedIconButton(IconData icon, VoidCallback onPressed) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.8, end: 1.0),
      duration: const Duration(milliseconds: 200),
      builder: (context, double scale, child) {
        return Transform.scale(
          scale: scale,
          child: IconButton(
            icon: Icon(icon, color: Colors.white),
            onPressed: () {
              onPressed();
            },
          ),
        );
      },
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: topics.length,
      itemBuilder: (context, index) {
        return _buildGridItem(index);
      },
    );
  }

  Widget _buildGridItem(int index) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.8, end: 1.0),
      duration: const Duration(milliseconds: 200),
      builder: (context, double scale, child) {
        return Transform.scale(
          scale: scale,
          child: child,
        );
      },
      child: GestureDetector(
        onTap: () => _openTopicDetails(topics[index]['title']),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                topics[index]['color'].withOpacity(0.7),
                topics[index]['color'].withOpacity(0.4),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: topics[index]['color'].withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                topics[index]['icon'],
                size: 45,
                color: Colors.white,
              ),
              const SizedBox(height: 12),
              Text(
                topics[index]['title'],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.1,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: topics.length,
      itemBuilder: (context, index) {
        return _buildListItem(index);
      },
    );
  }

  Widget _buildListItem(int index) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.8, end: 1.0),
      duration: const Duration(milliseconds: 200),
      builder: (context, double scale, child) {
        return Transform.scale(
          scale: scale,
          child: child,
        );
      },
      child: GestureDetector(
        onTap: () => _openTopicDetails(topics[index]['title']),
        child: Container(
          height: 120,
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                topics[index]['color'].withOpacity(0.7),
                topics[index]['color'].withOpacity(0.4),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: topics[index]['color'].withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    topics[index]['icon'],
                    size: 32,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        topics[index]['title'].toUpperCase(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Explore topic',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.8),
                          letterSpacing: 0.5,
                        ),
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
}