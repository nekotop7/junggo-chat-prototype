import 'package:flutter/material.dart';

/// 중고나라 디자인 시스템 색상 팔레트
/// Figma 피그마 데이터를 기반으로 추출
class AppColors {
  // Primary
  static const Color primary = Color(0xFF2C82FF);
  static const Color primaryLight = Color(0xFFE8F1FF);

  // Text
  static const Color textPrimary = Color(0xFF141313);
  static const Color textSecondary = Color(0xFF59616B);
  static const Color textDisabled = Color(0xFF9CA3AF);

  // Background
  static const Color bgWhite = Color(0xFFFFFFFF);
  static const Color bgInput = Color(0xFFF1F4F6);
  static const Color bgGray = Color(0xFFDADEE5);

  // Status
  static const Color success = Color(0xFF009F1F);
  static const Color successLight = Color(0xFFE4F8E8);
  static const Color teal = Color(0xFF00AEAC);

  // Seller Badge
  static const Color soldOut = Color(0xFF000000);
}

/// 중고나라 텍스트 스타일
class AppTextStyles {
  static const TextStyle heading1 = TextStyle(
    fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textPrimary, letterSpacing: -0.3,
  );
  static const TextStyle body1 = TextStyle(
    fontSize: 15, fontWeight: FontWeight.w400, color: AppColors.textPrimary,
  );
  static const TextStyle body2 = TextStyle(
    fontSize: 13, fontWeight: FontWeight.w400, color: AppColors.textSecondary,
  );
  static const TextStyle caption = TextStyle(
    fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.textDisabled,
  );
  static const TextStyle price = TextStyle(
    fontSize: 15, fontWeight: FontWeight.w700, color: AppColors.textPrimary,
  );
  static const TextStyle chipLabel = TextStyle(
    fontSize: 13, fontWeight: FontWeight.w500, color: AppColors.textPrimary,
  );
}
