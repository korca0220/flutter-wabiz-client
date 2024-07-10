import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_wabiz_client/model/project/project_model.dart';
import 'package:flutter_wabiz_client/theme.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

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
      body: Column(
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
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 16, 16, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(projectItemModel.type ?? ""),
                                        const Icon(Icons.keyboard_arrow_right)
                                      ],
                                    ),
                                    const Gap(12),
                                    Text(
                                      projectItemModel.title ?? "",
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    const Gap(12),
                                    Row(
                                      children: [
                                        Text(
                                          "${NumberFormat("###,###,###").format(((projectItemModel.totalFunded ?? 0) / (projectItemModel.price ?? 1)) * 100)} % 달성",
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w800,
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                        const Gap(12),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: AppColors.secondaryColor,
                                            borderRadius:
                                                BorderRadius.circular(3),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 6,
                                            vertical: 4,
                                          ),
                                          child: Text(
                                            "${DateTime.parse(projectItemModel.deadline ?? "").difference(DateTime.now()).inDays}일 남음",
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.primaryColor,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const Gap(12),
                                    Row(
                                      children: [
                                        Text(
                                          "${NumberFormat.currency(locale: "ko_KR", symbol: "").format(projectItemModel.totalFunded ?? 0)} 원 달성",
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const Gap(12),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: AppColors.bg,
                                            borderRadius:
                                                BorderRadius.circular(3),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6),
                                          child: Text(
                                            "${projectItemModel.totalFundedCount} 명 참여",
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const Divider(
                                color: AppColors.newBg,
                                height: 32,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "프로젝트 스토리",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const Gap(12),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.newBg,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: const EdgeInsets.all(12),
                                      child: const Text(
                                          "도서산간에 해당하는 서포터님은 배송 가능 여부를 반드시 메이커에게 문의 후 참여해주세요."),
                                    ),
                                    const Gap(12),
                                    Image.asset(
                                      "assets/image/advertising_image.png",
                                      fit: BoxFit.fitWidth,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
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
                                mainAxisAlignment: MainAxisAlignment.center,
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
      ),
      bottomNavigationBar: BottomAppBar(
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
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border,
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
      ),
    );
  }
}
