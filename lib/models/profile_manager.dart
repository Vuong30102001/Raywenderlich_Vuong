import 'package:flutter/material.dart';

class ProfileManager extends ChangeNotifier {
  // Trạng thái xem người dùng có đăng nhập không
  bool _isLoggedIn = false;
  // Thông tin hồ sơ của người dùng (giả sử là một chuỗi tên)
  String _profileName = 'Guest';
  // Trạng thái xem người dùng có muốn hiển thị cài đặt không
  bool _isDarkMode = false;

  // Getter để lấy trạng thái đăng nhập
  bool get isLoggedIn => _isLoggedIn;

  // Getter để lấy thông tin hồ sơ người dùng
  String get profileName => _profileName;

  // Getter để kiểm tra chế độ giao diện
  bool get isDarkMode => _isDarkMode;

  // Phương thức để đăng nhập
  void login(String name) {
    _profileName = name;
    _isLoggedIn = true;
    notifyListeners();
  }

  // Phương thức để đăng xuất
  void logout() {
    _profileName = 'Guest';
    _isLoggedIn = false;
    notifyListeners();
  }

  // Phương thức để thay đổi chế độ giao diện
  void toggleDarkMode() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  // Phương thức để cập nhật tên người dùng
  void updateProfileName(String newName) {
    _profileName = newName;
    notifyListeners();
  }
}
