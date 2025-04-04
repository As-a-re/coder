import 'package:flutter/material.dart';

class TopicDetailsScreen extends StatefulWidget {
  final String topic;

  // Add the details for each topic here
  final Map<String, Map<String, String>> topicDetails = {
    'Giving': {
      'bibleVerses': 'Acts 20:35,  1Cor 16:1-2,  11Cor 9:6-7,  11Cor 9:1-12',
      'explanation': 'Giving is the act of giving one-tenth of your income to God. It is a biblical practice that honors God and supports the work of the church.',
    },
    'Baptism': {
      'bibleVerses': 'Acts 2:38,  Rom 6:4,  Acts 10:47-48',
      'explanation': 'Baptism symbolizes the death, burial, and resurrection of Jesus Christ. It is an outward sign of an inward change in the believer’s life.',
    },
    'Miracles': {
      'bibleVerses': 'Acts 2:4,  Acts 9:33-42,  Acts 27:10,  Matt 7:21-23,  1Cor 13:8,  Eph 4:11-13',
      'explanation': 'Miracles are that which the force of nature cannot produce but supernatural forces.',
    },
    'Faith': {
      'bibleVerses': 'Hebrews 11:6,  John 3:16,  11Cor 5:7,  James 2:14',
      'explanation': 'Faith is trusting in God even when we cannot see or understand His plan. It is foundational to our relationship with God and the Christian life.',
    },
    'Prayer': {
      'bibleVerses': 'Matthew 7:7,  1Cor 14:34,  1Tim 2:8,  1Thes 5:17,  1Jhon 5:14,  Matt 26:39-44',
      'explanation': 'Prayer is communication with God. It is an essential part of a believer’s life, providing a way to express thanks, seek guidance, and make requests.',
    },
    'Salvation': {
      'bibleVerses': 'John 3:16,  Acts 2:38,  Rom 6:23,  Heb 5:8-9',
      'explanation': 'Salvation is the deliverance from sin and its consequences, achieved through faith in Jesus Christ. It is the gift of eternal life.',
    },
    'Church': {
      'bibleVerses': 'Matt 16:18,  Rom 16:16,  Acts 20:7,  Eph 1:22-23,  Eph 5:22-32,  Rom 12:4-5',
      'explanation': 'The church also known as the body refers to the saved or the called out.',
    },
    'Lord\'s Supper': {
      'bibleVerses': 'Matt 26:28,  1Cor 11:23-26,  Acts 2:42,  Acts 20:7',
      'explanation': 'Jesus Christ instituted the Lords Supper and told his disciples to do it in remeberance of him until he comes again.',
    },
    'Doctrine': {
      'bibleVerses': 'Matthew 6:14,  Rev 22:18-19,  Gal 1:6-11,  Eph 4:14,  Acts 2:42',
      'explanation': 'The doctrine of the church is based on the Bible only.',
    },
  };

  TopicDetailsScreen({super.key, required this.topic});

   @override
  State<TopicDetailsScreen> createState() => _TopicDetailsScreenState();
}

class _TopicDetailsScreenState extends State<TopicDetailsScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

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
      begin: const Offset(0, 0.5),
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

  @override
  Widget build(BuildContext context) {
    final details = widget.topicDetails[widget.topic];
    final topicColor = _getTopicColor(widget.topic);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.topic,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      topicColor.withOpacity(0.8),
                      topicColor.withOpacity(0.6),
                    ],
                  ),
                ),
                child: Icon(
                  _getTopicIcon(widget.topic),
                  size: 80,
                  color: Colors.white.withOpacity(0.3),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      _buildCard(
                        'Bible Verses',
                        details?['bibleVerses'] ?? 'No verse available',
                        Icons.book,
                        topicColor,
                      ),
                      const SizedBox(height: 20),
                      _buildCard(
                        'Explanation',
                        details?['explanation'] ?? 'No explanation available',
                        Icons.lightbulb_outline,
                        topicColor,
                      ),
                      const SizedBox(height: 30),
                      _buildActionButton(topicColor),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String title, String content, IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              // Add ripple effect without any action
            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(icon, color: color, size: 24),
                      const SizedBox(width: 12),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: color,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    content,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(Color color) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color, color.withOpacity(0.8)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () {
            // Add your action here
          },
          child: const Center(
            child: Text(
              'Learn More',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _getTopicColor(String topic) {
    switch (topic) {
      case 'Giving':
        return Colors.green;
      case 'Baptism':
        return Colors.blue;
      case 'Miracles':
        return Colors.purple;
      case 'Faith':
        return Colors.orange;
      case 'Prayer':
        return Colors.teal;
      case 'Salvation':
        return Colors.red;
      case 'Church':
        return Colors.lightGreen;
      case 'Lord\'s Supper':
        return Colors.pink;
      case 'Doctrine':
        return Colors.indigo;
      default:
        return Colors.blue;
    }
  }

  IconData _getTopicIcon(String topic) {
    switch (topic) {
      case 'Giving':
        return Icons.attach_money;
      case 'Baptism':
        return Icons.water;
      case 'Miracles':
        return Icons.calendar_today;
      case 'Faith':
        return Icons.verified;
      case 'Prayer':
        return Icons.air;
      case 'Salvation':
        return Icons.saved_search;
      case 'Church':
        return Icons.grass;
      case 'Lord\'s Supper':
        return Icons.favorite;
      case 'Doctrine':
        return Icons.forum;
      default:
        return Icons.article;
    }
  }
}