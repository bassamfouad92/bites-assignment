import 'package:bites_assignment/common/base/base_usecase.dart';
import 'package:bites_assignment/common/model/secure_user_session.dart';
import 'package:bites_assignment/common/network/http/dio_network_service.dart';
import 'package:bites_assignment/common/network/http/network_service.dart';
import 'package:bites_assignment/login/data/auth_repository.dart';
import 'package:bites_assignment/login/domain/login_usecase.dart';
import 'package:bites_assignment/login/ui/login_state.dart';
import 'package:bites_assignment/login/ui/login_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final networkServiceProvider =
    Provider<NetworkService>((ref) => DioNetworkService());

final userSessionProvider = Provider<UserSession>((ref) => SecureUserSession());

final authRepoProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
      ref.watch(networkServiceProvider), ref.watch(userSessionProvider));
});

final loginUseCaseProvider =
    Provider<UseCase>((ref) => LoginUsecase(ref.watch(authRepoProvider)));

final loginViewModelProvider =
    StateNotifierProvider<LoginViewModel, LoginState>(
        (ref) => LoginViewModel(ref.watch(loginUseCaseProvider)));
