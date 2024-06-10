import 'package:bites_assignment/common/base/base_usecase.dart';
import 'package:bites_assignment/home/data/contact_user.dart';
import 'package:bites_assignment/home/data/contacts_repository.dart';

class GetContactsUsecase
    extends UseCase<List<ContactUser>, Map<String, dynamic>> {
  final ContactsRepository _contactsRepository;

  GetContactsUsecase(this._contactsRepository);

  @override
  Future<List<ContactUser>> execute(Map<String, dynamic> params) async {
    try {
      return await _contactsRepository.getList();
    } catch (ex) {
      rethrow;
    }
  }
}
