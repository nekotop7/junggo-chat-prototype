import 'package:flutter/material.dart';

/// 채팅 상단 앱바
/// Figma: topbar (360x56) + TopBar > topbar/resource/centerarea
/// 판매자 이름, 응답시간, 뒤로가기/상세보기 버튼 포함
class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String sellerName;
  final String responseTime;

  const ChatAppBar({
    super.key,
    required this.sellerName,
    required this.responseTime,
  });

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          // 뒤로가기 버튼
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, size: 20, color: Color(0xFF141313)),
            onPressed: () => Navigator.maybePop(context),
          ),
          // 프로필 아바타
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFDADEE5),
            ),
            child: const Icon(Icons.person, size: 20, color: Color(0xFF9CA3AF)),
          ),
          const SizedBox(width: 8),
          // 판매자 이름 + 응답시간
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sellerName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF141313),
                    letterSpacing: -0.3,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  responseTime,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF59616B),
                  ),
                ),
              ],
            ),
          ),
          // 점선 메뉴 버튼
          IconButton(
            icon: const Icon(Icons.more_vert, size: 24, color: Color(0xFF141313)),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
