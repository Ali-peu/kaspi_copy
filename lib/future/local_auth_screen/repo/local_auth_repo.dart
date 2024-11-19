import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:kaspi_copy/app/core/secure_storage/app_secure_storage.dart';
import 'package:local_auth/local_auth.dart';

enum SupportState {
  unknown,
  supported,
  unsupported,
}

class LocalAuthRepo {
  LocalAuthRepo() {
    AppSecureStorage()
        .write(key: AppSecureStorageValueKey.appPincode, value: '9999');
    _init();
  }
  final LocalAuthentication auth = LocalAuthentication();
  final AppSecureStorage appSecureStorage = AppSecureStorage();

  late SupportState _supportState = SupportState.unknown;
  SupportState get supportState => _supportState;

  Future<void> _init() async {
    auth.isDeviceSupported().then((bool isSupported) {
      if (isSupported) {
        _supportState = SupportState.supported;
      } else {
        _supportState = SupportState.unsupported;
      }
    });
  }

  void printLog(Object? e, String name) {
    log(e.toString(), name: 'Error on $name');
  }

  Future<bool?> checkBiometrics() async {
    try {
      final canCheckBiometrics = await auth.canCheckBiometrics;
      return canCheckBiometrics;
    } on PlatformException catch (e) {
      printLog(e, 'checkBiometrics');
      return false;
    }
  }

  Future<List<BiometricType>?> getAvailableBiometrics() async {
    try {
      final availableBiometrics = await auth.getAvailableBiometrics();
      return availableBiometrics;
    } on PlatformException catch (e) {
      printLog(e, 'getAvailableBiometrics');
    }
    return null;
  }

  Future<bool> authenticate() async {
    try {
      final isAuthenticate = await auth.authenticate(
        localizedReason: 'Let OS determine authentication method',
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
      );
      return isAuthenticate;
    } on PlatformException catch (e) {
      printLog(e.message ?? '', 'authenticate');
      return false;
    }
  }

  Future<bool> authenticateWithBiometrics() async {
    try {
      final authenticated = await auth.authenticate(
        localizedReason:
            'Scan your fingerprint (or face or whatever) to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      return authenticated;
    } on PlatformException catch (e) {
      printLog(e, 'authenticateWithBiometrics');
      return false;
    }
  }

  Future<void> cancelAuthentication() async {
    await auth.stopAuthentication();
  }

  Future<bool> isAppPincodeRight(int pincode) async {
    final appPincode =
        await appSecureStorage.read(AppSecureStorageValueKey.appPincode);
    if (appPincode != null && int.parse(appPincode.toString()) == pincode) {
      return true;
    }
    return false;
  }
}
