import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WabizAppShell extends StatefulWidget {
  const WabizAppShell({
    required this.child,
    required this.currentIndex,
    super.key,
  });

  final Widget child;
  final int currentIndex;

  @override
  State<WabizAppShell> createState() => _WabizAppShellState();
}

class _WabizAppShellState extends State<WabizAppShell> {
  void _onTapTab(int index) {
    switch (index) {
      case 0:
        context.go('/home');

      case 3:
        context.go('/my');
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.currentIndex,
        onTap: (index) => _onTapTab(index),
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "홈",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "프로젝트",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              widget.currentIndex == 2 ? Icons.favorite : Icons.favorite_border,
            ),
            label: "구독",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              widget.currentIndex == 3 ? Icons.person : Icons.person_2_outlined,
            ),
            label: "마이페이지",
          ),
        ],
      ),
    );
  }
}
