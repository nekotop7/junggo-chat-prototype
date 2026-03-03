import 'package:flutter/material.dart';

/// 채팅 입력창
/// Figma: CTA > Input/Chat (360x56) bg=rgb(255,255,255)
/// 왼쪽 카메라/사진 버튼 + 중앙 텍스트 입력 박스 (bg=#F1F4F6) + 오른쪽 추가/Send 버튼
class ChatInputBar extends StatefulWidget {
  final TextEditingController controller;

  const ChatInputBar({super.key, required this.controller});

  @override
  State<ChatInputBar> createState() => _ChatInputBarState();
}

class _ChatInputBarState extends State<ChatInputBar> {
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    final hasText = widget.controller.text.isNotEmpty;
    if (hasText != _hasText) {
      setState(() => _hasText = hasText);
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 상단 구분선
          Container(
            height: 1,
            color: const Color(0xFFDADEE5),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // 왼쪽: 사진/파일 첨부 버튼
                _buildIconButton(
                  icon: Icons.image_outlined,
                  onTap: () {},
                ),
                const SizedBox(width: 4),
                // 중앙: 텍스트 입력 필드
                Expanded(
                  child: Container(
                    constraints: const BoxConstraints(minHeight: 38, maxHeight: 120),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F4F6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      controller: widget.controller,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color(0xFF141313),
                        height: 1.4,
                      ),
                      decoration: const InputDecoration(
                        hintText: '메시지를 입력하세요',
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF9CA3AF),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        border: InputBorder.none,
                        isDense: true,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                // 오른쪽: 눈(미리보기) or Send 버튼
                _hasText
                    ? _buildSendButton()
                    : _buildIconButton(
                        icon: Icons.visibility_outlined,
                        onTap: () {},
                      ),
                const SizedBox(width: 2),
                if (!_hasText)
                  _buildSendButtonInactive(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        child: Icon(icon, size: 24, color: const Color(0xFF9CA3AF)),
      ),
    );
  }

  Widget _buildSendButton() {
    return GestureDetector(
      onTap: () {
        widget.controller.clear();
      },
      child: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        child: Container(
          width: 32,
          height: 32,
          decoration: const BoxDecoration(
            color: Color(0xFF2C82FF),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.send_rounded, size: 18, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildSendButtonInactive() {
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: const Color(0xFFDADEE5),
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.send_rounded, size: 18, color: Color(0xFF9CA3AF)),
      ),
    );
  }
}
