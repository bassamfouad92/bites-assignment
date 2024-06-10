import 'package:bites_assignment/common/base/base_usecase.dart';
import 'package:bites_assignment/home/ui/home_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewModel extends StateNotifier<HomeState> {
  final UseCase contactsUseCase;

  HomeViewModel(this.contactsUseCase) : super(const HomeState.initial());

  Future<void> fetchContacts() async {
    try {
      final Map<String, dynamic> params = {'page': 1};
      final contacts = await contactsUseCase.execute(params);
      state = HomeState(contacts: AsyncValue.data(contacts));
    } catch (ex, stackTrace) {
      state = HomeState(contacts: AsyncValue.error(ex, stackTrace));
    }
  }
}
