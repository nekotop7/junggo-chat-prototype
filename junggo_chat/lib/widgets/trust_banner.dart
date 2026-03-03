import 'package:flutter/material.dart';

/// 안심결제 배너
/// Figma: Banner/Floating (344x38) bg=rgb(228,248,232)
/// 초록 배경, 안심결제 아이콘/텍스트, 닫기 버튼
class TrustBanner extends StatelessWidget {
  final VoidCallback? onDismiss;

  const TrustBanner({super.key, this.onDismiss});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFE4F8E8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            // 안심결제 아이콘
            Container(
              width: 16,
              height: 16,
              decoration: const BoxDecoration(
                color: Color(0xFF009F1F),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check, size: 10, color: Colors.white),
            ),
            const SizedBox(width: 8),
            // 텍스트
            const Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '안심결제',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF009F1F),
                      ),
                    ),
                    TextSpan(
                      text: '  쓰고 사기 걱정 없는 중고거래를 권장합니다.',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF141313),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // 닫기(접기) 버튼
            GestureDetector(
              onTap: onDismiss,
              child: const Icon(
                Icons.keyboard_arrow_down,
                size: 16,
                color: Color(0xFF009F1F),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
