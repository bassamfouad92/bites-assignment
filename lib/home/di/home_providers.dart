import 'package:bites_assignment/common/base/base_usecase.dart';
import 'package:bites_assignment/common/network/http/dio_network_service.dart';
import 'package:bites_assignment/common/network/http/network_service.dart';
import 'package:bites_assignment/home/data/contacts_repository.dart';
import 'package:bites_assignment/home/domain/get_contacts_usecase.dart';
import 'package:bites_assignment/home/ui/home_state.dart';
import 'package:bites_assignment/home/ui/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final networkServiceProvider =
    Provider<NetworkService>((ref) => DioNetworkService());

final contactsRepoProvider = Provider<ContactsRepository>(
    (ref) => ContactsRepositoryImpl(ref.watch(networkServiceProvider)));

final contactsUseCaseProvider = Provider<UseCase>(
    (ref) => GetContactsUsecase(ref.watch(contactsRepoProvider)));

final homeViewModelProvider =
    StateNotifierProvider<HomeViewModel, HomeState>((ref) {
  final viewModel = HomeViewModel(ref.watch(contactsUseCaseProvider));
  viewModel.fetchContacts();
  return viewModel;
});
