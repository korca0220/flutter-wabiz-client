import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_wabiz_client/model/project/project_model.dart';
import 'package:flutter_wabiz_client/theme.dart';
import 'package:flutter_wabiz_client/view_model/project/project_view_model.dart';
import 'package:flutter_wabiz_client/views/project/detail/bottom_appbar.dart';
import 'package:flutter_wabiz_client/views/project/detail/project_widget.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ProjectDetailPage extends StatefulWidget {
  const ProjectDetailPage({
    super.key,
    required this.project,
  });

  final String project;

  @override
  State<ProjectDetailPage> createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {
  late ProjectItemModel projectItemModel;

  ValueNotifier<bool> isMore = ValueNotifier(false);

  @override
  void initState() {
    super.initState();

    projectItemModel = ProjectItemModel.fromJson(
      jsonDecode(
        widget.project,
      ),
    );
  }

  @override
  void dispose() {
    isMore.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.go('/home');
            },
            icon: SvgPicture.asset(
              "assets/icons/home_outlined.svg",
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final project = ref.watch(
            projectDetailViewModelProvider(
              projectItemModel.id.toString(),
            ),
          );

          return project.when(
            error: (err, stack) => Center(
              child: Text(
                err.toString(),
              ),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            data: (projectModel) {
              if (projectModel == null) {
                return const Center(
                  child: Text("데이터가 없습니다."),
                );
              }

              return Column(
                children: [
                  Container(
                    height: 240,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          projectItemModel.thumbnail ?? "",
                        ),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.2),
                          BlendMode.darken,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ValueListenableBuilder(
                        valueListenable: isMore,
                        builder: (context, value, child) {
                          return Stack(
                            children: [
                              Positioned.fill(
                                child: SingleChildScrollView(
                                  physics: !value
                                      ? const NeverScrollableScrollPhysics()
                                      : const BouncingScrollPhysics(),
                                  child: ProjectWidget(
                                      projectItemModel: projectModel),
                                ),
                              ),
                              if (!value)
                                Positioned(
                                  left: 16,
                                  right: 16,
                                  bottom: 0,
                                  child: Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          Colors.white,
                                          Colors.white.withOpacity(0.1),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              if (!value)
                                Positioned(
                                  left: 16,
                                  right: 16,
                                  bottom: 16,
                                  child: GestureDetector(
                                    onTap: () => isMore.value = true,
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "스토리 더보기",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: AppColors.primaryColor,
                                            ),
                                          ),
                                          Gap(12),
                                          Icon(
                                            Icons.keyboard_arrow_down,
                                            color: AppColors.primaryColor,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                            ],
                          );
                        }),
                  )
                ],
              );
            },
          );
        },
      ),
      bottomNavigationBar: ProjectBottomAppBar(
        project: projectItemModel,
      ),
    );
  }
}
