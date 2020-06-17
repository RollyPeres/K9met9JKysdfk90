import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../shared/shared.dart';
import '../../auth.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  
  final AuthRepository repository = AuthRepository();
  
  @override
  LoginState get initialState => LoginState.initial();

  @override
  Stream<Transition<LoginEvent, LoginState>> transformEvents(
    Stream<LoginEvent> events,
    TransitionFunction<LoginEvent, LoginState> transitionFn,
  ) {
    final nonDebounceStream = events.where((event) {
      return (event is! LoginEmailChanged && event is! LoginPasswordChanged);
    });
    final debounceStream = events.where((event) {
      return (event is LoginEmailChanged || event is LoginPasswordChanged);
    }).debounceTime(Duration(milliseconds: 300));
    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      transitionFn,
    );
  }

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginEmailChanged) {
      yield* _mapLoginEmailChangedToState(event.email);
    } else if (event is LoginPasswordChanged) {
      yield* _mapLoginPasswordChangedToState(event.password);
    } else if (event is GetSubmittedLogin) {
      yield* _mapSubmittedLoginToState(
        email: event.email,
        password: event.password,
      );
    }
  }

  Stream<LoginState> _mapLoginEmailChangedToState(String email) async* {
    yield state.update(
      isEmailValid: Validators.isValidEmail(email),
    );
  }

  Stream<LoginState> _mapLoginPasswordChangedToState(String password) async* {
    yield state.update(
      isPasswordValid: Validators.isValidSimplePassword(password),
    );
  }

  Stream<LoginState> _mapSubmittedLoginToState({
    String email,
    String password,
  }) async* {
    yield LoginState.loading();
    try {
      final loginModel = LoginModel(email: email, password: password);
      await repository.postLogin(loginModelToJson(loginModel));
      yield LoginState.success();
    } catch (_) {
      yield LoginState.failure();
    }
  }
}
