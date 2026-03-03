import 'package:flutter/material.dart';
import 'screens/chat_screen.dart';

void main() {
  runApp(const JunggoApp());
}

class JunggoApp extends StatelessWidget {
  const JunggoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '중고나라 채팅',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Pretendard',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2C82FF),
        ),
        useMaterial3: true,
      ),
      home: const ChatScreen(),
    );
  }
}
