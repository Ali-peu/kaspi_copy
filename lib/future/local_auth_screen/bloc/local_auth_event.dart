part of 'local_auth_bloc.dart';

@immutable
sealed class LocalAuthEvent {
  const LocalAuthEvent();
}

class EnterPassword extends LocalAuthEvent {
  final int pincode;
  const EnterPassword({required this.pincode});
}


