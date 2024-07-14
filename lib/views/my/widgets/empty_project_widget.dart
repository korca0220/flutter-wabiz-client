import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../theme.dart';

class EmptyProjectWidget extends StatelessWidget {
  const EmptyProjectWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
