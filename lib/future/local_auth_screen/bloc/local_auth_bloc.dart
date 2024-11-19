import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kaspi_copy/future/local_auth_screen/repo/local_auth_repo.dart';
import 'package:meta/meta.dart';

part 'local_auth_event.dart';
part 'local_auth_state.dart';

class LocalAuthBloc extends Bloc<LocalAuthEvent, LocalAuthState> {
  final LocalAuthRepo _localAuthRepo;
  LocalAuthBloc({required LocalAuthRepo localAuthRepo})
      : _localAuthRepo = localAuthRepo,
        super(LocalAuthState(dateTime: DateTime.now())) {
    on<EnterPassword>((event, emit) async {
      final value = await _localAuthRepo.isAppPincodeRight(event.pincode);
      emit(state.copyWith(isSuccess: value));
    });
  }
}
