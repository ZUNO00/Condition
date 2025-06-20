import 'dart:io';

void main() {
  stdout.write("Nhập họ tên nhân viên: ");
  String name = stdin.readLineSync() ?? "";

  double hours = _readDouble("Nhập số giờ làm việc: ");
  double rate = _readDouble("Nhập lương mỗi giờ: ");

  double grossSalary = hours * rate;

  // Phụ cấp nếu làm > 40h
  double allowance = 0;
  if (hours > 40) {
    allowance = grossSalary * 0.2;
  }

  double totalBeforeTax = grossSalary + allowance;

  // Thuế thu nhập
  double tax = 0;
  if (totalBeforeTax > 10000000) {
    tax = totalBeforeTax * 0.10;
  } else if (totalBeforeTax >= 7000000) {
    tax = totalBeforeTax * 0.05;
  }

  double netSalary = totalBeforeTax - tax;

  print("\n--- KẾT QUẢ ---");
  print("👤 Họ tên: $name");
  print("💵 Tổng lương trước thuế: ${totalBeforeTax.toStringAsFixed(2)} đ");
  print("📉 Thuế thu nhập: ${tax.toStringAsFixed(2)} đ");
  print("✅ Lương thực lãnh: ${netSalary.toStringAsFixed(2)} đ");
}

double _readDouble(String prompt) {
  while (true) {
    stdout.write(prompt);
    try {
      return double.parse(stdin.readLineSync()!);
    } catch (_) {
      print("❌ Giá trị không hợp lệ. Vui lòng nhập số.");
    }
  }
}
