import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_wabiz_client/shared/enum/enum_project_class.dart';
import 'package:flutter_wabiz_client/shared/model/project_type.dart';
import 'package:flutter_wabiz_client/theme.dart';
import 'package:flutter_wabiz_client/view_model/project/project_view_model.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../model/project/project_model.dart';

class AddProjectPage extends StatefulWidget {
  const AddProjectPage({super.key});

  @override
  State<AddProjectPage> createState() => _AddProjectPageState();
}

class _AddProjectPageState extends State<AddProjectPage> {
  EnumProjectClass enumProjectClass = EnumProjectClass.funding;

  TextEditingController priceTextEditingController = TextEditingController();
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController makerTextEditingController = TextEditingController();
  TextEditingController deadlineTextEditingController = TextEditingController();
  TextEditingController descriptionTextEditingController =
      TextEditingController();

  ProjectType? projectType;
  XFile? image;

  @override
  void dispose() {
    priceTextEditingController.dispose();
    titleTextEditingController.dispose();
    makerTextEditingController.dispose();
    deadlineTextEditingController.dispose();
    descriptionTextEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("프로젝트 정보"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('카테고리'),
              const Gap(12),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.white,
                      builder: (context) {
                        return SizedBox(
                          height: MediaQuery.sizeOf(context).height - 240,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("카테고리"),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.clear,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Consumer(builder: (context, ref, child) {
                                  final types =
                                      ref.watch(fetchProjectTypesProvider);

                                  return switch (types) {
                                    AsyncData(:final value) =>
                                      ListView.separated(
                                        itemBuilder: (context, index) {
                                          final data = value[index];

                                          return ListTile(
                                            leading: SvgPicture.asset(
                                                data.imagePath ?? ""),
                                            title: Text(data.type ?? ""),
                                            onTap: () {
                                              setState(() {
                                                projectType = data;
                                              });

                                              Navigator.of(context).pop();
                                            },
                                          );
                                        },
                                        separatorBuilder: (_, __) {
                                          return const Divider();
                                        },
                                        itemCount: value.length,
                                      ),
                                    AsyncError(:var error) => Center(
                                        child: Text(error.toString()),
                                      ),
                                    _ => const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                  };
                                }),
                              ),
                            ],
                          ),
                        );
                      });
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: AppColors.wabizGray[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${projectType != null ? projectType?.type : '카테고리 선택'}',
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(24),
              const Text(
                '프로젝트 유형',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const Gap(12),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.wabizGray[200],
                ),
                child: Column(
                  children: [
                    RadioListTile(
                      value: EnumProjectClass.funding,
                      groupValue: enumProjectClass,
                      onChanged: (state) {
                        setState(() {
                          enumProjectClass = state ?? EnumProjectClass.funding;
                        });
                      },
                      title: Text(EnumProjectClass.funding.title),
                      subtitle: Text(EnumProjectClass.funding.subTitle),
                    ),
                    RadioListTile(
                      value: EnumProjectClass.freeOrder,
                      groupValue: enumProjectClass,
                      onChanged: (state) {
                        setState(() {
                          enumProjectClass = state ?? EnumProjectClass.funding;
                        });
                      },
                      title: Text(EnumProjectClass.funding.title),
                      subtitle: Text(EnumProjectClass.funding.subTitle),
                    ),
                    RadioListTile(
                      value: EnumProjectClass.freeOrderEncore,
                      groupValue: enumProjectClass,
                      onChanged: (state) {
                        setState(() {
                          enumProjectClass = state ?? EnumProjectClass.funding;
                        });
                      },
                      title: Text(EnumProjectClass.funding.title),
                      subtitle: Text(EnumProjectClass.funding.subTitle),
                    ),
                    RadioListTile(
                      value: EnumProjectClass.freeOrderGlobal,
                      groupValue: enumProjectClass,
                      onChanged: (state) {
                        setState(() {
                          enumProjectClass = state ?? EnumProjectClass.funding;
                        });
                      },
                      title: Text(EnumProjectClass.funding.title),
                      subtitle: Text(EnumProjectClass.funding.subTitle),
                    ),
                  ],
                ),
              ),
              const Gap(24),
              const Text(
                "목표 금액",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const Gap(12),
              const Text("최소 50만 원 ~ 최대 1억 원 사이에서 설명해 주세요."),
              const Gap(12),
              TextFormField(
                controller: priceTextEditingController,
                decoration: const InputDecoration(
                  hintText: "목표 금액을 입력해 주세요.",
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
              const Gap(24),
              const Text(
                "프로젝트 제목",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const Gap(12),
              TextFormField(
                controller: titleTextEditingController,
                decoration: const InputDecoration(
                  hintText: "제목을 입력해 주세요.",
                ),
                maxLength: 40,
              ),
              const Gap(24),
              const Text(
                "프로젝트 메이커",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const Gap(12),
              TextFormField(
                controller: makerTextEditingController,
                decoration: const InputDecoration(
                  hintText: "메이커 명을 입력해 주세요",
                ),
              ),
              const Gap(24),
              const Text(
                "대표 이미지",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const Gap(12),
              Text(
                "메인, 검색 결과, SNS 광고 등 여러 곳에서 노출할 대표 이미지를 등록해 주세요.",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: AppColors.wabizGray[400],
                ),
              ),
              const Gap(12),
              InkWell(
                onTap: () async {
                  final picker = ImagePicker();

                  image = await picker.pickImage(source: ImageSource.gallery);

                  setState(() {});
                },
                child: Container(
                  height: 70,
                  width: 86,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.wabizGray[200]!,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.camera_alt),
                      Text("${image == null ? "0" : "1"}/1")
                    ],
                  ),
                ),
              ),
              const Gap(24),
              const Text(
                "프로젝트 종료일",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const Gap(12),
              TextFormField(
                controller: deadlineTextEditingController,
                decoration: InputDecoration(
                  hintText: "예시) 2024-05-05",
                  suffixIcon: IconButton(
                    onPressed: () async {
                      final date = await showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2024, 12, 31),
                      );

                      deadlineTextEditingController.text =
                          DateFormat("yyyy-MM-dd")
                              .format(date ?? DateTime.now());
                    },
                    icon: const Icon(
                      Icons.calendar_month,
                    ),
                  ),
                ),
              ),
              const Gap(24),
              const Text(
                "프로젝트 요약",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const Gap(12),
              Text(
                "소개 영상이나 사진과 함께 보이는 글이에요. 프로젝트를 쉽고 간결하게 소개해주세요.",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: AppColors.wabizGray[400],
                ),
              ),
              const Gap(12),
              TextFormField(
                controller: descriptionTextEditingController,
                decoration: const InputDecoration(
                  hintText: "내용 입력",
                ),
                maxLines: 4,
                maxLength: 100,
              ),
              const Gap(24),
              Consumer(
                builder: (context, ref, child) {
                  return MaterialButton(
                    onPressed: () async {
                      final selectedImage = await image?.readAsBytes();

                      final response = await ref
                          .read(projectViewModelProvider.notifier)
                          .createProject(
                            ProjectItemModel(
                              categoryId: 1,
                              projectTypeId: projectType?.id,
                              title: titleTextEditingController.text.trim(),
                              owner: makerTextEditingController.text.trim(),
                              deadline:
                                  deadlineTextEditingController.text.trim(),
                              description:
                                  descriptionTextEditingController.text.trim(),
                              price: int.tryParse(
                                  priceTextEditingController.text.trim()),
                              projectClass: enumProjectClass.title,
                              userId: "1",
                              projectImage: selectedImage ?? [],
                            ),
                          );

                      if (response) {
                        if (context.mounted) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("안내"),
                                  content: const Text("프로젝트가 성공적으로 등록되었습니다."),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        context.go("/my");
                                      },
                                      child: const Text("마이페이지"),
                                    ),
                                  ],
                                );
                              });
                        }
                      } else {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("프로젝트 등록에 실패했습니다."),
                            ),
                          );
                        }
                      }
                    },
                    height: 50,
                    minWidth: double.infinity,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: AppColors.primaryColor,
                    child: const Text(
                      '저장하기',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  );
                },
              ),
              const Gap(24),
            ],
          ),
        ),
      ),
    );
  }
}
