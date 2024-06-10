import 'package:bites_assignment/home/data/contact_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum HomeConcreteState {
  loading,
  loaded,
  failure,
}

class HomeState {
  final AsyncValue<List<ContactUser>> contacts;

  const HomeState({
    required this.contacts,
  });

  const HomeState.initial() : contacts = const AsyncValue.loading();
}
