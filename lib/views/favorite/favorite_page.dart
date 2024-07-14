import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wabiz_client/theme.dart';
import 'package:flutter_wabiz_client/view_model/favorite/favorite_view_model.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

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

                      return Container(
                        margin: const EdgeInsets.only(
                            left: 16, right: 16, top: 20, bottom: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 8),
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 30,
                              spreadRadius: 4,
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 190,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                      project.thumbnail ?? ""),
                                  fit: BoxFit.cover,
                                ),
                                color: Colors.amber,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    right: 8,
                                    top: 8,
                                    child: IconButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                content:
                                                    const Text('구독을 취소할까요?'),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        ref
                                                            .read(
                                                                favoriteViewModelProvider
                                                                    .notifier)
                                                            .removeItem(
                                                                project);

                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: const Text('네'))
                                                ],
                                              );
                                            });
                                      },
                                      icon: const Icon(
                                        Icons.favorite,
                                      ),
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${NumberFormat("###,###,###").format(project.totalFundedCount)}명이 기다려요",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  const Gap(8),
                                  Text("${project.title}"),
                                  const Gap(24),
                                  Text(
                                    "${project.owner}",
                                    style: TextStyle(
                                      color: AppColors.wabizGray[500]!,
                                    ),
                                  ),
                                  const Gap(12),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.bg,
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 4,
                                    ),
                                    child: Text(project.isOpen == "open"
                                        ? "바로구매"
                                        : "오픈예정"),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
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
