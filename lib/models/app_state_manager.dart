import 'package:flutter/material.dart';

class AppStateManager extends ChangeNotifier {
  // Trạng thái xem người dùng đã đăng nhập chưa
  bool _isLoggedIn = false;
  int selectedTab = 0;
  String _username = '';
  String _password = '';
  // Trạng thái xem người dùng đã hoàn tất onboarding chưa
  bool _isOnboardingComplete = false;

  // Getter cho trạng thái đăng nhập
  bool get isLoggedIn => _isLoggedIn;

  // Getter cho trạng thái hoàn tất onboarding
  bool get isOnboardingComplete => _isOnboardingComplete;

  void  login(String username, String password){
    _username = username;
    _password = password;
    _isLoggedIn = true;
    notifyListeners();
  }
  // Phương thức để đăng xuất
  void logout() {
    _isLoggedIn = false;
    _username = '';
    _password = '';
    _isOnboardingComplete = false;
    notifyListeners();
  }

  // Phương thức đánh dấu hoàn tất onboarding
  void completeOnboarding() {
    _isOnboardingComplete = true;
    notifyListeners();
  }

  void onboarded() {
    _isOnboardingComplete = true;
    notifyListeners(); // Thông báo cho các widget khác rằng trạng thái đã thay đổi
  }

  void goToTab(int index) {
    selectedTab = index;
    notifyListeners();
  }
}
