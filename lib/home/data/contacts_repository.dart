import 'package:bites_assignment/common/enum/api_status.dart';
import 'package:bites_assignment/common/model/exceptions.dart';
import 'package:bites_assignment/common/network/http/network_service.dart';
import 'package:bites_assignment/home/data/contact_user.dart';

abstract interface class ContactsRepository {
  Future<List<ContactUser>> getList();
}

class ContactsRepositoryImpl implements ContactsRepository {
  final NetworkService _networkService;

  ContactsRepositoryImpl(this._networkService);

  @override
  Future<List<ContactUser>> getList() async {
    final response = await _networkService.get("/contacts");
    try {
      final status = response.statusCode as int;
      if (status.toApiStatus() == ApiStatus.success) {
        List<dynamic> jsonList = response.data;
        return jsonList.map((json) => ContactUser.fromJson(json)).toList();
      } else {
        throw NotFoundException();
      }
    } catch (ex) {
      throw APIFailedException();
    }
  }
}
