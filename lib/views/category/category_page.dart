import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
        ],
      ),
    );
  }
}
