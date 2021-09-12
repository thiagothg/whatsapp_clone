import 'package:get/get.dart';
import 'package:whatsapp_clone/models/contact_model.dart';

class GroupController extends GetxController {
  List<ContactModel> newGroupList = <ContactModel>[].obs;

  void addContactToNewGroup(ContactModel contactModel) {
    var found =
        newGroupList.where((el) => el.name == contactModel.name).toList();
    if (found.length == 0) {
      newGroupList.add(contactModel);
    }
  }

  void removeContactFromNewGroup(ContactModel contactModel) {
    var found = newGroupList.where((el) => el.name == contactModel.name);
    if (found.length > 0) {
      newGroupList.remove(contactModel);
    }
  }
}
