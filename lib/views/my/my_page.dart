import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_wabiz_client/theme.dart';
import 'package:flutter_wabiz_client/view_model/login/login_view_model.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

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
          final loginState = ref.watch(loginViewModelProvider);

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
                      Consumer(
                        builder: (context, ref, child) {
                          if (loginState.isLogin) {
                            return Row(
                              children: [
                                const CircleAvatar(
                                  radius: 24,
                                  backgroundColor: AppColors.bg,
                                ),
                                const Gap(8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("${loginState.email}"),
                                      const Gap(4),
                                      Text("${loginState.username}"),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Row(
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
                            );
                          }
                        },
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 28,
                            backgroundColor: AppColors.wabizGray[200],
                            child: SvgPicture.asset(
                              "assets/icons/featured_seasonal_and_gifts.svg",
                              width: 28,
                              height: 28,
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          const Gap(20),
                          const Text(
                            "새로운 도전을\n시작해보세요.",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                            ),
                          ),
                          const Gap(20),
                          const Text(
                            "개인 후원부터 제품, 콘텐츠, 서비스 출시, 성장까지 함께할게요.",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {},
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
