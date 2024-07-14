import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wabiz_client/model/category/category_model.dart';
import 'package:flutter_wabiz_client/model/project/project_model.dart';
import 'package:flutter_wabiz_client/theme.dart';
import 'package:flutter_wabiz_client/view_model/favorite/favorite_view_model.dart';
import 'package:gap/gap.dart';

class ProjectBottomAppBar extends ConsumerWidget {
  const ProjectBottomAppBar({
    super.key,
    required this.project,
  });

  final ProjectItemModel project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoriteViewModelProvider);
    final current = favorites.projects.firstWhereOrNull(
      (element) => element.id == project.id,
    );

    return BottomAppBar(
      height: 84,
      color: Colors.white,
      surfaceTintColor: Colors.white,
      padding: EdgeInsets.zero,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey[200]!,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
        child: Row(
          children: [
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    if (current != null) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: const Text('구독을 취소할까요?'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      ref
                                          .read(favoriteViewModelProvider
                                              .notifier)
                                          .removeItem(CategoryItemModel(
                                            id: project.id,
                                          ));

                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('네'))
                              ],
                            );
                          });

                      return;
                    }

                    ref
                        .read(favoriteViewModelProvider.notifier)
                        .addItem(CategoryItemModel(
                          id: project.id,
                          title: project.title,
                          thumbnail: project.thumbnail,
                          description: project.description,
                          owner: project.owner,
                          totalFunded: project.totalFunded,
                          totalFundedCount: project.totalFundedCount,
                        ));
                  },
                  icon: Icon(
                    current == null ? Icons.favorite_border : Icons.favorite,
                    color: current == null ? Colors.black : Colors.red,
                  ),
                ),
                const Text("1만+")
              ],
            ),
            const Gap(12),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 50,
                child: const Center(
                  child: Text(
                    "펀딩하기",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
