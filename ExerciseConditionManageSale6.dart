import 'dart:io';

void main() {
  stdout.write("Nhập tên sản phẩm: ");
  String name = stdin.readLineSync() ?? "";

  int quantity = _readInt("Nhập số lượng mua: ");
  double price = _readDouble("Nhập đơn giá: ");

  double amount = quantity * price;

  // Tính giảm giá
  double discount = 0;
  if (amount >= 1000000) {
    discount = amount * 0.10;
  } else if (amount >= 500000) {
    discount = amount * 0.05;
  }

  double amountAfterDiscount = amount - discount;

  // Tính VAT 8%
  double vat = amountAfterDiscount * 0.08;

  double totalPayable = amountAfterDiscount + vat;

  // In kết quả
  print("\n====== HÓA ĐƠN BÁN HÀNG ======");
  print("🛒 Tên sản phẩm: $name");
  print("📦 Số lượng    : $quantity");
  print("💰 Đơn giá     : ${price.toStringAsFixed(0)} đ");
  print("-------------------------------");
  print("💵 Thành tiền  : ${amount.toStringAsFixed(0)} đ");
  print("🔻 Giảm giá    : ${discount.toStringAsFixed(0)} đ");
  print("🧾 VAT (8%)    : ${vat.toStringAsFixed(0)} đ");
  print("✅ Tổng thanh toán: ${totalPayable.toStringAsFixed(0)} đ");
  print("===============================");
}

int _readInt(String prompt) {
  while (true) {
    stdout.write(prompt);
    try {
      return int.parse(stdin.readLineSync()!);
    } catch (_) {
      print("❌ Vui lòng nhập số nguyên.");
    }
  }
}

double _readDouble(String prompt) {
  while (true) {
    stdout.write(prompt);
    try {
      return double.parse(stdin.readLineSync()!);
    } catch (_) {
      print("❌ Vui lòng nhập số hợp lệ.");
    }
  }
}
