import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wabiz_client/theme.dart';
import 'package:flutter_wabiz_client/view_model/login/login_view_model.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "로그인",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: AppColors.wabizGray[900],
              ),
            ),
            const Gap(32),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: '이메일 입력',
                    ),
                  ),
                  const Gap(20),
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      hintText: '비밀번호 입력',
                    ),
                  )
                ],
              ),
            ),
            const Gap(8),
            ButtonBar(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    '로그인 정보를 잊으셨나요?',
                    style: TextStyle(
                      color: AppColors.wabizGray[600],
                    ),
                  ),
                ),
              ],
            ),
            const Gap(24),
            Consumer(
              builder: (context, ref, child) {
                return GestureDetector(
                  onTap: () async {
                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty) return;

                    final result =
                        await ref.read(loginViewModelProvider.notifier).signIn(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                            );

                    if (result != null) {
                      if (context.mounted) {
                        context.go('/my');
                      }
                    }
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        '이메일로 로그인하기',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const Gap(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '아직 계정이 없나요?',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.wabizGray[900],
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.primaryColor,
                    textStyle: const TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () {
                    context.push('/sign-up');
                  },
                  child: const Text('회원 가입'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
