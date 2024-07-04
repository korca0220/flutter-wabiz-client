import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wabiz_client/model/login/login_model.dart';
import 'package:flutter_wabiz_client/theme.dart';
import 'package:flutter_wabiz_client/view_model/login/login_view_model.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '이메일 간편가입',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.wabizGray[900],
                  ),
                ),
                const Gap(20),
                const Text(
                  '이메일 계정',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Gap(20),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          hintText: "아이디 입력",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '필수 입력 항목입니다.';
                          }
                          return null;
                        },
                      ),
                    ),
                    const Gap(12),
                    Consumer(
                      builder: (context, ref, child) {
                        return GestureDetector(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                            }
                            final result = await ref
                                .read(loginViewModelProvider.notifier)
                                .checkEmail(
                                  LoginModel(
                                    email: emailController.text.trim(),
                                  ),
                                );

                            if (context.mounted) {
                              if (result) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const AlertDialog(
                                      content: Text(
                                        '등록 가능한 이메일입니다.',
                                        textAlign: TextAlign.center,
                                      ),
                                    );
                                  },
                                );
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return const AlertDialog(
                                        content: Text(
                                          '등록 불가능한 이메일입니다.\n다시 확인해주세요.',
                                          textAlign: TextAlign.center,
                                        ),
                                      );
                                    });
                              }
                            }
                          },
                          child: Container(
                            height: 55,
                            width: 90,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                '인증하기',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const Gap(20),
                const Text(
                  '이름',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Gap(20),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: "이름 입력",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '필수 입력 항목입니다.';
                    }
                    return null;
                  },
                ),
                const Gap(20),
                const Text(
                  "비밀번호",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Gap(20),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: "비밀번호 입력",
                    filled: true,
                    fillColor: AppColors.newBg,
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.visibility),
                    ),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '필수 입력 항목입니다.';
                    }
                    return null;
                  },
                ),
                const Gap(12),
                TextFormField(
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                    hintText: "비밀번호 확인",
                    filled: true,
                    fillColor: AppColors.newBg,
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.visibility),
                    ),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '필수 입력 항목입니다.';
                    }

                    if (value != passwordController.text) {
                      return '비밀번호가 일치하지 않습니다.';
                    }

                    return null;
                  },
                ),
                const Gap(20),
                Consumer(
                  builder: (context, ref, child) {
                    return GestureDetector(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          final result = await ref
                              .read(loginViewModelProvider.notifier)
                              .signUp(
                                LoginModel(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                  username: nameController.text.trim(),
                                ),
                              );

                          if (result) {
                            if (!context.mounted) return;

                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: const Text('등록 성공: 로그인을 진행해주세요.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        context.pop();
                                        context.pop();
                                      },
                                      child: const Text('확인'),
                                    )
                                  ],
                                );
                              },
                            );
                          } else {
                            if (!context.mounted) return;
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  content: Text('신규 회원가입 실패.'),
                                );
                              },
                            );
                          }
                        }
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            '약관 동의 후 가입 완료하기',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
