import 'package:flutter/material.dart';

/// 채팅 하단 퀵메뉴 칩
/// Figma: 채팅 하단 퀵메뉴 (360x32) - 3개 칩
/// "안심결제", "쓰고 사기 걱정 없는 중고거래...", "지금 거래되나요?"
class QuickMenuChips extends StatelessWidget {
  const QuickMenuChips({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildChip('안심결제'),
            const SizedBox(width: 8),
            _buildChip('쓰고 사기 걱정 없는 중고거래를 권장합니다.'),
            const SizedBox(width: 8),
            _buildChip('지금 거래되나요?'),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String label) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFFDADEE5), width: 1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 14,
              height: 14,
              decoration: const BoxDecoration(
                color: Color(0xFFDADEE5),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, size: 10, color: Color(0xFF59616B)),
            ),
            const SizedBox(width: 4),
            Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color(0xFF141313),
              ),
            ),
            const SizedBox(width: 4),
            const Icon(
              Icons.chevron_right,
              size: 14,
              color: Color(0xFF9CA3AF),
            ),
          ],
        ),
      ),
    );
  }
}
