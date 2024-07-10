import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wabiz_client/theme.dart';
import 'package:flutter_wabiz_client/view_model/home/home_view_model.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final numberFormatter = NumberFormat("###,###,###,###");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 324,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: TextFormField(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: AppColors.wabizGray[100]!,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: AppColors.wabizGray[100]!,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                hintText: "새로운 일상이 필요하신가요?",
                                suffixIcon: const Icon(
                                  Icons.search,
                                ),
                                suffixIconColor: AppColors.wabizGray[400],
                              ),
                              onTap: () {},
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.notifications_none),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, bottom: 16),
                      child: Consumer(builder: (context, ref, child) {
                        final categories =
                            ref.watch(fetchHomeCategoriesProvider);

                        return switch (categories) {
                          AsyncData(:final value) => GridView.builder(
                              scrollDirection: Axis.horizontal,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 0,
                              ),
                              itemCount: value.length,
                              itemBuilder: (context, index) {
                                final category = value[index];

                                return InkWell(
                                  onTap: () {
                                    context
                                        .push("/home/category/${category.id}");
                                  },
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 38,
                                        backgroundColor: AppColors.bg,
                                        child: Image.asset(
                                          category.iconPath ?? "",
                                          height: 42,
                                          width: 42,
                                        ),
                                      ),
                                      const Gap(4),
                                      Text(category.title ?? ""),
                                    ],
                                  ),
                                );
                              },
                            ),
                          AsyncError(:final error) => Text(error.toString()),
                          _ => const Center(
                              child: CircularProgressIndicator(),
                            ),
                        };
                      }),
                    ),
                  ),
                  Container(
                    width: 48,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.bg,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const Gap(12),
                ],
              ),
            ),
            const Gap(12),
            Expanded(
              child: Consumer(
                builder: (context, ref, child) {
                  // final project =
                  //     ref.watch(homeViewModelProvider.notifier).fetchHomeData();

                  final homeData = ref.watch(fetchHomeProjectProvider);

                  return homeData.when(
                    data: (data) {
                      if (data.projects.isEmpty) {
                        return Column(
                          children: [
                            const Text('정보가 없습니다'),
                            TextButton(
                              onPressed: () {},
                              child: const Text('새로고침'),
                            )
                          ],
                        );
                      }
                      return Container(
                        color: Colors.white,
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            final project = data.projects[index];

                            return InkWell(
                              onTap: () {
                                context.push(
                                  '/detail',
                                  extra: jsonEncode(project.toJson()),
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                  bottom: 8,
                                  left: 16,
                                  right: 16,
                                  top: 20,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 30,
                                      spreadRadius: 4,
                                      offset: const Offset(0, 8),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      height: 200,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: CachedNetworkImageProvider(
                                            project.thumbnail ?? "",
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            project.isOpen == "close"
                                                ? "${numberFormatter.format(project.waitlistCount)}명이 기다려요."
                                                : "${numberFormatter.format(project.totalFundedCount)}명이 인증했어요.",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18,
                                              color: AppColors.primaryColor,
                                            ),
                                          ),
                                          const Gap(8),
                                          Text(project.title ?? ""),
                                          const Gap(16),
                                          Text(
                                            project.owner ?? " 세상에 없던 브랜드를",
                                            style: TextStyle(
                                              color: AppColors.wabizGray[500],
                                            ),
                                          ),
                                          const Gap(16),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 6,
                                              vertical: 4,
                                            ),
                                            decoration: BoxDecoration(
                                              color: AppColors.bg,
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                            ),
                                            child: Text(
                                              project.isOpen == "close"
                                                  ? "오픈예정"
                                                  : "바로구매",
                                              style: const TextStyle(
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                    error: (error, trace) => Text(error.toString()),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
