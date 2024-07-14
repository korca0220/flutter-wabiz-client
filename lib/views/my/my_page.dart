import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wabiz_client/model/project/project_model.dart';
import 'package:flutter_wabiz_client/theme.dart';
import 'package:flutter_wabiz_client/view_model/login/login_view_model.dart';
import 'package:flutter_wabiz_client/view_model/my/my_view_model.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'widgets/empty_project_widget.dart';

class MyPage extends ConsumerStatefulWidget {
  const MyPage({super.key});

  @override
  ConsumerState<MyPage> createState() => _MyPageState();
}

class _MyPageState extends ConsumerState<MyPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("마이페이지"),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: AppColors.wabizGray[900],
        ),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final myPageState = ref.watch(myPageViewModelProvider);

          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  height: 470,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (myPageState.loginState ?? false) ...{
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 24,
                              backgroundColor: AppColors.bg,
                            ),
                            const Gap(8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${myPageState.loginModel?.email}"),
                                  const Gap(4),
                                  Text(
                                    "${myPageState.loginModel?.username} 님 안녕하세요?",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              tooltip: "로그아웃",
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text("로그아웃"),
                                        content: const Text("로그아웃 하시겠습니까?"),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              context.pop();
                                            },
                                            child: const Text("취소"),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              ref
                                                  .read(loginViewModelProvider
                                                      .notifier)
                                                  .signOut();
                                              context.pop();
                                            },
                                            child: const Text("확인"),
                                          ),
                                        ],
                                      );
                                    });
                              },
                              icon: const Icon(
                                Icons.logout,
                              ),
                            ),
                          ],
                        ),
                      } else ...{
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 24,
                              backgroundColor: AppColors.bg,
                            ),
                            const Gap(8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    context.push('/sign-in');
                                  },
                                  child: const Row(
                                    children: [
                                      Text('로그인하기'),
                                      Icon(
                                        Icons.keyboard_arrow_right,
                                      )
                                    ],
                                  ),
                                ),
                                const Gap(4),
                                const Text(
                                  "로그인 후 다양한 프로젝트에 참여해보세요.",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      },
                      Consumer(
                        builder: (context, ref, child) {
                          final isLogin =
                              ref.watch(myPageViewModelProvider).loginState ??
                                  false;

                          if (!isLogin) return const EmptyProjectWidget();

                          return FutureBuilder(
                            future: ref
                                .watch(myPageViewModelProvider.notifier)
                                .fetchUserProjects(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                List<ProjectItemModel> lists =
                                    snapshot.data ?? [];
                                if (lists.isEmpty) {
                                  return const EmptyProjectWidget();
                                }

                                return Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Gap(24),
                                      const Text("나의 프로젝트"),
                                      Expanded(
                                        child: ListView.builder(
                                          itemCount: lists.length,
                                          itemBuilder: (context, index) {
                                            final project = lists[index];

                                            return ListTile(
                                              title: Text("${project.title}"),
                                              subtitle: Text(
                                                "${project.description}",
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              leading: Text("${project.type}"),
                                              trailing: PopupMenuButton(
                                                itemBuilder: (context) {
                                                  return [
                                                    PopupMenuItem(
                                                      child:
                                                          const Text("리워드 추가"),
                                                      onTap: () {
                                                        context.push(
                                                            "/add/reward/${project.id}");
                                                      },
                                                    ),
                                                    PopupMenuItem(
                                                      child: const Text(
                                                          "프로젝트 오픈상태 수정"),
                                                      onTap: () {
                                                        showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              bool openState =
                                                                  project.isOpen ==
                                                                          "open"
                                                                      ? true
                                                                      : false;

                                                              return StatefulBuilder(
                                                                  builder: (context,
                                                                      setState) {
                                                                return AlertDialog(
                                                                  title: const Text(
                                                                      "프로젝트 오픈상태 수정"),
                                                                  content:
                                                                      Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      SwitchListTile
                                                                          .adaptive(
                                                                        title: const Text(
                                                                            "오픈 상태"),
                                                                        value:
                                                                            openState,
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            openState =
                                                                                value;
                                                                          });
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () async {
                                                                        final result = await ref
                                                                            .read(myPageViewModelProvider.notifier)
                                                                            .updateProject(
                                                                              project.id.toString(),
                                                                              ProjectItemModel(
                                                                                isOpen: openState ? "open" : "close",
                                                                              ),
                                                                            );

                                                                        if (result) {
                                                                          if (context
                                                                              .mounted) {
                                                                            setState(() {});

                                                                            Navigator.of(context).pop();
                                                                          }
                                                                        }
                                                                      },
                                                                      child: const Text(
                                                                          '저장'),
                                                                    )
                                                                  ],
                                                                );
                                                              });
                                                            });
                                                      },
                                                    ),
                                                    PopupMenuItem(
                                                      onTap: () {
                                                        showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              return AlertDialog(
                                                                content: const Text(
                                                                    "삭제하시겠습니까?"),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed:
                                                                        () async {
                                                                      final result = await ref
                                                                          .read(myPageViewModelProvider
                                                                              .notifier)
                                                                          .deleteProject(project
                                                                              .id
                                                                              .toString());

                                                                      if (result) {
                                                                        if (context
                                                                            .mounted) {
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                          setState(
                                                                              () {});
                                                                        }
                                                                      }
                                                                    },
                                                                    child:
                                                                        const Text(
                                                                            '네'),
                                                                  ),
                                                                  TextButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    },
                                                                    child: const Text(
                                                                        '아니오'),
                                                                  ),
                                                                ],
                                                              );
                                                            });
                                                      },
                                                      child:
                                                          const Text("프로젝트 삭제"),
                                                    ),
                                                  ];
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }

                              if (snapshot.hasError) {
                                return Center(
                                  child: Text(
                                    "에러가 발생했습니다. ${snapshot.error}",
                                  ),
                                );
                              }

                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          );
                        },
                      ),
                      InkWell(
                        onTap: () {
                          context.push("/add");

                          if (!(myPageState.loginState ?? true)) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("로그인"),
                                  content: const Text("로그인 후 프로젝트를 만들 수 있습니다."),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        context.pop();
                                      },
                                      child: const Text("취소"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        context.pop();
                                        context.push('/sign-in');
                                      },
                                      child: const Text("로그인"),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              "프로젝트 만들기",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
