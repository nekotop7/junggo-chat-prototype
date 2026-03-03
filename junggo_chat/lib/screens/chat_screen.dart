import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/chat_app_bar.dart';
import '../widgets/trust_banner.dart';
import '../widgets/product_info_bar.dart';
import '../widgets/quick_menu_chips.dart';
import '../widgets/chat_input_bar.dart';
import '../widgets/chat_messages_area.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _inputController = TextEditingController();
  bool _showBanner = true;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // 1. 채팅 상단바 (TopBar)
            const ChatAppBar(
              sellerName: '배부른오리와둥댕이는',
              responseTime: '보통 3시간 이내 응답',
            ),
            // 2. 안심결제 배너
            if (_showBanner)
              TrustBanner(
                onDismiss: () => setState(() => _showBanner = false),
              ),
            // 3. 채팅 메시지 영역 (스크롤 가능)
            const Expanded(
              child: ChatMessagesArea(),
            ),
            // 4. 퀵메뉴 칩 (빠른 질문 버튼)
            const QuickMenuChips(),
            // 5. 상품 정보 바
            const ProductInfoBar(
              productName: '애플 아이폰12미니 MINI 실버 새상품 팔아요',
              price: '880,000원',
              freeShipping: true,
              isSoldOut: true,
            ),
            // 6. 채팅 입력창
            ChatInputBar(controller: _inputController),
            // 7. 하단 OS 네비게이션 (Android 제스처 영역 대응)
            const SizedBox(height: 0),
          ],
        ),
      ),
    );
  }
}
