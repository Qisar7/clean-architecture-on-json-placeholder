import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class InternetChecker {
  Future<bool> get IsDiviceConnected;
}

class InternetCheckerimpl implements InternetChecker {
  final InternetConnectionChecker internetConnectionChecker;

  InternetCheckerimpl(this.internetConnectionChecker);

  @override
  Future<bool> get IsDiviceConnected => internetConnectionChecker.hasConnection;
}
