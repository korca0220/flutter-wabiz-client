import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wabiz_client/model/project/project_model.dart';
import 'package:flutter_wabiz_client/view_model/favorite/favorite_view_model.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../theme.dart';

class ProjectLargeWidget extends ConsumerWidget {
  const ProjectLargeWidget({
    super.key,
    required this.projectDataString,
    this.showFavoriteButton = false,
  });

  final String projectDataString;
  final bool showFavoriteButton;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numberFormatter = NumberFormat("###,###,###,###");

    final project = ProjectItemModel.fromJson(jsonDecode(projectDataString));

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
              child: Stack(
                children: [
                  showFavoriteButton
                      ? Positioned(
                          right: 8,
                          top: 8,
                          child: IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: const Text('구독을 취소할까요?'),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              ref
                                                  .read(
                                                      favoriteViewModelProvider
                                                          .notifier)
                                                  .removeItem(
                                                    project.id!,
                                                  );

                                              Navigator.of(context).pop();
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
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Text(
                      project.isOpen == "close" ? "오픈예정" : "바로구매",
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
  }
}
