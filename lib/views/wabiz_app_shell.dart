import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wabiz_client/view_model/login/login_view_model.dart';
import 'package:go_router/go_router.dart';

class WabizAppShell extends ConsumerStatefulWidget {
  const WabizAppShell({
    required this.child,
    required this.currentIndex,
    super.key,
  });

  final Widget child;
  final int currentIndex;

  @override
  ConsumerState<WabizAppShell> createState() => _WabizAppShellState();
}

class _WabizAppShellState extends ConsumerState<WabizAppShell> {
  void _onTapTab(int index) {
    switch (index) {
      case 0:
        context.go('/home');
      case 2:
        context.go('/favorite');
      case 1:
        if (ref.read(loginViewModelProvider).isLogin) {
          context.push('/add');
        } else {
          showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                title: Text("안내"),
                content: Text("로그인이 필요한 서비스입니다."),
              );
            },
          );
        }
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
