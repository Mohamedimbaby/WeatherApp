import 'package:flutter/material.dart';
class AnimatedSearchScreen extends StatefulWidget {
  const AnimatedSearchScreen({super.key});

  @override
  _AnimatedSearchScreenState createState() => _AnimatedSearchScreenState();
}

class _AnimatedSearchScreenState extends State<AnimatedSearchScreen> with SingleTickerProviderStateMixin {
  bool _isSearchActive = false;
  late AnimationController _controller;
  late Animation<double> _widthAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _widthAnimation = Tween<double>(begin: 50.0, end: 300.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleSearch() {
    setState(() {
      _isSearchActive = !_isSearchActive;
      if (_isSearchActive) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Search App'),
        actions: [
          Container(
            width: _widthAnimation.value,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    _isSearchActive ? Icons.close : Icons.search,
                    color: Colors.blue,
                  ),
                  onPressed: _toggleSearch,
                ),
                if (_isSearchActive)
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text('Press the search icon to start searching.'),
      ),
    );
  }
}