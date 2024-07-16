import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wabiz_client/shared/widgets/project_large_widget.dart';
import 'package:flutter_wabiz_client/theme.dart';
import 'package:flutter_wabiz_client/view_model/favorite/favorite_view_model.dart';
import 'package:gap/gap.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<String> tabs = [
    '펀딩',
    '메이커',
    '알림신청',
    '펀딩/프리오더',
    '스토어',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Text(
                    '관심 있는 소식만 모았어요',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                      )),
                ],
              ),
            ),
            Container(
              height: 32,
              padding: const EdgeInsets.only(left: 16),
              child: ListView.builder(
                itemCount: tabs.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: const BoxDecoration(
                      color: AppColors.newBg,
                    ),
                    child: Center(
                      child: Text(
                        tabs[index],
                      ),
                    ),
                  );
                },
              ),
            ),
            const Gap(12),
            Expanded(
              child: Consumer(
                builder: (context, ref, child) {
                  final favorites = ref.watch(favoriteViewModelProvider);
                  if (favorites.projects.isEmpty) {
                    return const Center(
                      child: Text('등록된 관심(구독) 프로젝트가 없어요.'),
                    );
                  }

                  return ListView.builder(
                    itemCount: favorites.projects.length,
                    itemBuilder: (context, index) {
                      final project = favorites.projects[index];

                      return ProjectLargeWidget(
                        projectDataString: jsonEncode(project.toJson()),
                        showFavoriteButton: true,
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
