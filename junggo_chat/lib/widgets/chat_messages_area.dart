import 'package:flutter/material.dart';

/// 채팅 메시지 빈 상태 영역 (첫진입 화면)
/// Figma: 채팅 내용 없음, 하단 퀵 제안 메시지가 보이는 상태
class ChatMessagesArea extends StatelessWidget {
  const ChatMessagesArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Spacer(),
          // 첫 진입 안내 텍스트
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                Text(
                  '대화를 해볼까요?',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF9CA3AF),
                  ),
                ),
                const SizedBox(height: 16),
                // 퀵 제안 메시지들
                _buildSuggestionMessage('안녕하세요'),
                const SizedBox(height: 8),
                _buildSuggestionMessage('📦 이 상품 관련 문의 드립니다'),
                const SizedBox(height: 8),
                _buildSuggestionMessage('지금 거래 되나요?'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestionMessage(String text) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFFDADEE5), width: 1),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF141313),
          ),
        ),
      ),
    );
  }
}
