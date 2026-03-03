import 'package:flutter/material.dart';

/// 상품 정보 바
/// Figma: Frame 2147224474 (360x56) bg=rgb(255,255,255)
/// 상품이미지 + 상품명 + 가격 + 무료배송 + 구매하기 버튼
/// 판매완료 뱃지(검정) 포함
class ProductInfoBar extends StatelessWidget {
  final String productName;
  final String price;
  final bool freeShipping;
  final bool isSoldOut;

  const ProductInfoBar({
    super.key,
    required this.productName,
    required this.price,
    this.freeShipping = false,
    this.isSoldOut = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          // 상품 이미지 (썸네일)
          Stack(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: const Color(0xFFDADEE5),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(Icons.image_outlined, size: 20, color: Color(0xFF9CA3AF)),
              ),
              // 판매완료 뱃지
              if (isSoldOut)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 14,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(6)),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      '판매완료',
                      style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              // 인증셀러 뱃지
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                  decoration: BoxDecoration(
                    color: const Color(0xFF00AEAC),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4),
                      bottomRight: Radius.circular(4),
                    ),
                  ),
                  child: const Text(
                    '인증셀러',
                    style: TextStyle(fontSize: 7, fontWeight: FontWeight.w500, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
          // 상품명 + 가격
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF59616B),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF141313),
                      ),
                    ),
                    if (freeShipping) ...[
                      const SizedBox(width: 6),
                      const Text(
                        '무료배송',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF141313),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // 구매하기 버튼
          SizedBox(
            height: 32,
            child: ElevatedButton(
              onPressed: isSoldOut ? null : () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: isSoldOut ? const Color(0xFFDADEE5) : const Color(0xFF2C82FF),
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: Text(
                isSoldOut ? '판매완료' : '구매하기',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
