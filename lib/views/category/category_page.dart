import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_wabiz_client/theme.dart';
import 'package:gap/gap.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({
    super.key,
    required this.categoryId,
  });

  final String categoryId;

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('카테고리'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/home_outlined.svg',
              width: 24,
              height: 24,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 204,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey[800],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "최고의 이어폰 | 전문가가 만든 완벽한 이어폰",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Gap(12),
                const Text(
                  "전문가가 만든 이어폰 하나",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const Gap(16),
                Container(
                  height: 4,
                  width: 120,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 110,
            padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
            decoration: const BoxDecoration(
              color: Colors.grey,
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: IntrinsicWidth(
                    child: Column(
                      children: [
                        const Gap(8),
                        const CircleAvatar(
                          radius: 16,
                        ),
                        const Gap(12),
                        const Text("테크"),
                        const Gap(12),
                        Container(
                          height: 6,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const Divider(
            height: 8,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                    ),
                    child: Row(
                      children: [
                        DropdownButton(
                          items: const [
                            DropdownMenuItem(
                              child: Text('전체'),
                            )
                          ],
                          onChanged: (value) {},
                          icon: const Icon(Icons.keyboard_arrow_down),
                          underline: const SizedBox.shrink(),
                        ),
                        const Gap(24),
                        DropdownButton(
                          items: const [
                            DropdownMenuItem(
                              child: Text('추천순'),
                            )
                          ],
                          onChanged: (value) {},
                          icon: const Icon(Icons.keyboard_arrow_down),
                          underline: const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 24),
                            child: Row(
                              children: [
                                Container(
                                  height: 120,
                                  width: 164,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blue,
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        right: 2,
                                        top: 2,
                                        child: IconButton(
                                          onPressed: () {},
                                          icon:
                                              const Icon(Icons.favorite_border),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const Gap(16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        '[내 손안의 와이파이] 와이파이 6와이파이 6',
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const Gap(8),
                                      Text(
                                        "홍길동",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.wabizGray[500],
                                        ),
                                      ),
                                      const Gap(8),
                                      const Text(
                                        '1,000 명 참여',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                      const Gap(8),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 6,
                                          vertical: 4,
                                        ),
                                        decoration: const BoxDecoration(
                                          color: AppColors.bg,
                                        ),
                                        child: const Text(
                                          '1,000원',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
